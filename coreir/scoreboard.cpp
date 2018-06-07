#include <string>
#include <iostream>
#include <sstream>
#include <math.h>
#include "coreir.h"
//#define ARRAY
#ifdef ARRAY
 #include "fifo_mem.h"
#else
 #include "fifo.h"
#endif
#include "mux.h"

using namespace CoreIR;
using namespace std;

int main() {
  Context *c = newContext();

  // Load utils
  CoreIRUtils(c);

  // Load FIFO
  Namespace *global = CoreIRFIFO(c);

  Params mptParams({{"depth", c->Int()}});
  TypeGen *mptTypeGen = global->newTypeGen(
        "MPTTypeGen",
        mptParams,
        [](Context *c, Values args) {
          uint depth = args.at("depth")->get<int>();
          uint cntWidth = static_cast<uint>(log2(depth) + 0.5) + 1;
          return c->Record({
              {"clk", c->Named("coreir.clkIn")},
              {"rst", c->BitIn()},
              {"push", c->BitIn()},
              {"pop", c->BitIn()},
              {"captured", c->BitIn()},
              {"cnt", c->Array(cntWidth, c->Bit())},
              {"next_cnt", c->Array(cntWidth, c->Bit())}}
          );
        });

  Generator *mpt = global->newGeneratorDecl("MagicPacketTracker", mptTypeGen, mptParams);
  mpt->setGeneratorDefFromFun([](Context *c, Values args, ModuleDef *def) {
      uint depth = args.at("depth")->get<int>();
      uint cntWidth = static_cast<uint>(log2(depth) + 0.5) + 1;
      Values cwArg({{"width", Const::make(c, cntWidth)}});
      Values dArg({{"depth", Const::make(c, depth)}});
      Values wOne({{"width", Const::make(c, 1)}});

      //****** Single Static Assignment Intermediate Signal ******//
      def->addInstance("cnt", "coreir.reg", cwArg, {{"init", Const::make(c, BitVector(cntWidth, 0))}});
      def->connect("self.clk", "cnt.clk");

      def->addInstance("cnt_lt_depth", "coreir.ult", cwArg);
      def->addInstance("depth", "coreir.const", cwArg, {{"value", Const::make(c, cntWidth, depth)}});
      def->addInstance("ssa_cnt_and1", "coreir.and", wOne);
      def->addInstance("ssa_cnt_and2", "coreir.and", wOne);
      def->addInstance("not_captured", "coreir.not", wOne);
      def->addInstance("ssa_cnt", "coreir.mux", cwArg);
      def->addInstance("cnt_p1", "coreir.add", cwArg);
      def->addInstance("one", "coreir.const", cwArg, {{"value", Const::make(c, cntWidth, 1)}});

      // ssa_cnt connections
      def->connect("cnt.out", "cnt_lt_depth.in0");
      def->connect("depth.out", "cnt_lt_depth.in1");
      def->connect("cnt_lt_depth.out", "ssa_cnt_and1.in0.0");
      def->connect("self.push", "ssa_cnt_and1.in1.0");
      def->connect("self.captured", "not_captured.in.0");
      def->connect("ssa_cnt_and1.out", "ssa_cnt_and2.in0");
      def->connect("not_captured.out", "ssa_cnt_and2.in1");
      def->connect("ssa_cnt_and2.out.0", "ssa_cnt.sel");
      def->connect("cnt.out", "cnt_p1.in0");
      def->connect("one.out", "cnt_p1.in1");
      def->connect("cnt.out", "ssa_cnt.in0");
      def->connect("cnt_p1.out", "ssa_cnt.in1");

      //************ Compute Next Value ***************//
      // Using Single Static Assignment.
      // Increments/Decrements until magic packet captured
      // Then only decrements until magic packet exits
      // Behavior after exit is undefined/unimportant

      def->addInstance("next_cnt", "coreir.mux", cwArg);
      def->addInstance("ssa_cnt_gt_0", "coreir.ugt", cwArg);
      def->addInstance("zero", "coreir.const", cwArg, {{"value", Const::make(c, cntWidth, 0)}});
      def->addInstance("next_cnt_and1", "coreir.and", wOne);
      def->addInstance("ssa_cnt_m1", "coreir.sub", cwArg);
      def->addInstance("decr_mux", "coreir.mux", cwArg);

      // next_cnt connections
      def->connect("ssa_cnt.out", "ssa_cnt_gt_0.in0");
      def->connect("zero.out", "ssa_cnt_gt_0.in1");
      def->connect("ssa_cnt_gt_0.out", "next_cnt_and1.in0.0");
      def->connect("self.pop", "next_cnt_and1.in1.0");
      def->connect("ssa_cnt.out", "ssa_cnt_m1.in0");
      def->connect("one.out", "ssa_cnt_m1.in1");
      def->connect("next_cnt_and1.out.0", "decr_mux.sel");
      def->connect("ssa_cnt.out", "decr_mux.in0");
      def->connect("ssa_cnt_m1.out", "decr_mux.in1");
      def->connect("self.rst", "next_cnt.sel");
      def->connect("decr_mux.out", "next_cnt.in0");
      def->connect("zero.out", "next_cnt.in1");
      def->connect("next_cnt.out", "cnt.in");

      // Interface
      def->connect("cnt.out", "self.cnt");
      def->connect("next_cnt.out", "self.next_cnt");
    });

  // Top level module -- scoreboard
  uint width = 8;
  uint depth = 8;
  uint cntWidth = static_cast<uint>(log2(depth) + 0.5) + 1;
  Values wArg({{"width", Const::make(c, width)}});
  Values cwArg({{"width", Const::make(c, cntWidth)}});
  Values dArg({{"depth", Const::make(c, depth)}});
  Values wOne({{"width", Const::make(c, 1)}});

  Module *scoreboard = global->newModuleDecl("scoreboard",
         c->Record({
             {"clk", c->Named("coreir.clkIn")},
             {"rst", c->BitIn()},
             {"push", c->BitIn()},
             {"pop", c->BitIn()},
             {"start", c->BitIn()},
             {"data_in", c->BitIn()->Arr(width)},
             {"data_out", c->Bit()->Arr(width)},
             {"full", c->Bit()},
             {"empty", c->Bit()},
             {"data_out_vld", c->Bit()},
             {"prop_signal", c->Bit()}}));

  ModuleDef *sbdef = scoreboard->newModuleDef();

  // fifo
  sbdef->addInstance("f", "global.fifo",
                     {{"width", Const::make(c, width)},
                      {"depth", Const::make(c, depth)}});

  // fifo connections
  sbdef->connect("self.clk", "f.clk");
  sbdef->connect("self.rst", "f.rst");
  sbdef->connect("self.push", "f.push");
  sbdef->connect("self.pop", "f.pop");
  sbdef->connect("self.data_in", "f.data_in");
  sbdef->connect("f.full", "self.full");
  sbdef->connect("f.empty", "self.empty");
  sbdef->connect("f.data_out", "self.data_out");

  sbdef->addInstance("en", "coreir.reg", wOne);
  sbdef->addInstance("start_and_push", "coreir.and", wOne);
  sbdef->addInstance("en_or_sp", "coreir.or", wOne);

  // connections for en
  sbdef->connect("self.clk", "en.clk");
  sbdef->connect("self.start", "start_and_push.in0.0");
  sbdef->connect("self.push", "start_and_push.in1.0");
  sbdef->connect("en.out", "en_or_sp.in0");
  sbdef->connect("start_and_push.out", "en_or_sp.in1");
  sbdef->connect("en_or_sp.out", "en.in");

  sbdef->addInstance("magic_packet", "coreir.reg", wArg);
  sbdef->addInstance("next_magic_packet", "coreir.mux", wArg);
  sbdef->addInstance("not_en", "coreir.not", wOne);
  sbdef->addInstance("mp_en", "coreir.and", wOne);

  // connections for magic_packet
  sbdef->connect("self.clk", "magic_packet.clk");
  sbdef->connect("en.out", "not_en.in");
  sbdef->connect("start_and_push.out", "mp_en.in0");
  sbdef->connect("not_en.out", "mp_en.in1");
  sbdef->connect("next_magic_packet.out", "magic_packet.in");
  sbdef->connect("mp_en.out.0", "next_magic_packet.sel");
  sbdef->connect("magic_packet.out", "next_magic_packet.in0");
  sbdef->connect("self.data_in", "next_magic_packet.in1");

  sbdef->addInstance("mpt", "global.MagicPacketTracker", dArg);
  // connections for mpt
  sbdef->connect("self.clk", "mpt.clk");
  sbdef->connect("self.rst", "mpt.rst");
  sbdef->connect("self.push", "mpt.push");
  sbdef->connect("self.pop", "mpt.pop");
  sbdef->connect("en.out.0", "mpt.captured");

  sbdef->addInstance("data_out_vld_and1", "coreir.and", wOne);
  sbdef->addInstance("data_out_vld_and2", "coreir.and", wOne);
  sbdef->addInstance("cnt_gt_0", "coreir.ugt", cwArg);
  sbdef->addInstance("zero", "coreir.const", cwArg, {{"value", Const::make(c, cntWidth, 0)}});
  sbdef->addInstance("next_cnt_eq0", "coreir.eq", cwArg);

  // data_out_vld connections
  sbdef->connect("mpt.cnt", "cnt_gt_0.in0");
  sbdef->connect("zero.out", "cnt_gt_0.in1");
  sbdef->connect("en.out", "data_out_vld_and1.in0");
  sbdef->connect("cnt_gt_0.out", "data_out_vld_and1.in1.0");
  sbdef->connect("mpt.next_cnt", "next_cnt_eq0.in0");
  sbdef->connect("zero.out", "next_cnt_eq0.in1");
  sbdef->connect("data_out_vld_and1.out", "data_out_vld_and2.in0");
  sbdef->connect("next_cnt_eq0.out", "data_out_vld_and2.in1.0");
  sbdef->connect("data_out_vld_and2.out.0", "self.data_out_vld");

  // prop_signal instances
  sbdef->addInstance("not_data_out_vld", "coreir.not", wOne);
  sbdef->addInstance("prop_signal_or", "coreir.or", wOne);
  sbdef->addInstance("magic_packet_eq", "coreir.eq", wArg);

  // prop_signal connections
  sbdef->connect("data_out_vld_and2.out", "not_data_out_vld.in");
  sbdef->connect("magic_packet.out", "magic_packet_eq.in0");
  sbdef->connect("f.data_out", "magic_packet_eq.in1");
  sbdef->connect("not_data_out_vld.out", "prop_signal_or.in0");
  sbdef->connect("magic_packet_eq.out", "prop_signal_or.in1.0");
  sbdef->connect("prop_signal_or.out.0", "self.prop_signal");

  scoreboard->setDef(sbdef);
  scoreboard->print();

  c->runPasses({"rungenerators","flatten"});

  saveToFile(global, "scoreboard.json", scoreboard);

  return 0;
}
