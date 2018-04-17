#include <string>
#include <iostream>
#include <sstream>
#include <math.h>
#include "coreir.h"
#include <utility>

using namespace CoreIR;
using namespace std;

Namespace * CoreIRFIFO(Context *c) {
  Namespace *global = c->getGlobal();

  Params fifoParams({{"width", c->Int()}, {"depth", c->Int()}});

  TypeGen *fifoTypeGen = global->newTypeGen(
      "FIFOTypeGen",
      fifoParams,
      [](Context *c, Values args) {
        Value *widthArg = args.at("width");
        uint width = widthArg->get<int>();

        return c->Record({
            {"clk", c->Named("coreir.clkIn")},
            {"rst", c->BitIn()},
            {"push", c->BitIn()},
            {"pop", c->BitIn()},
            {"data_in", c->Array(width, c->BitIn())},
            {"full", c->Bit()},
            {"empty", c->Bit()},
            {"data_out", c->Array(width, c->Bit())}
          });
      });

  Generator *fifo = global->newGeneratorDecl("fifo", fifoTypeGen, fifoParams);
  fifo->setGeneratorDefFromFun([](Context *c, Values args, ModuleDef *def) {
      uint width = args.at("width")->get<int>();
      uint depth = args.at("depth")->get<int>();
      uint ptrWidth = static_cast<uint>(log2(depth) + 0.5) + 1;

      Values wArg({{"width", Const::make(c, width)}});
      Values pwArg({{"width", Const::make(c, ptrWidth)}});

      def->addInstance("zero", "coreir.const", pwArg, {{"value", Const::make(c, ptrWidth, 0)}});
      def->addInstance("one", "coreir.const", pwArg, {{"value", Const::make(c, ptrWidth, 1)}});

      def->addInstance("wrPtr", "coreir.reg", pwArg, {{"init", Const::make(c, BitVector(ptrWidth, 0))}});;
      def->addInstance("rdPtr", "coreir.reg", pwArg, {{"init", Const::make(c, BitVector(ptrWidth, 0))}});
      def->addInstance("wrPtrEn", "coreir.mux", pwArg);
      def->addInstance("rdPtrEn", "coreir.mux", pwArg);
      def->addInstance("wrPtrRst", "coreir.mux", pwArg);
      def->addInstance("rdPtrRst", "coreir.mux", pwArg);

      // mantle.reg generator is stale -- still uses coreir.regrst
      // Values mregArgs({{"width", Const::make(c, ptrWidth)},{"has_en", Const::make(c, true)},{"has_rst", Const::make(c, true)}});
      // Values zPtrInit({{"init", Const::make(c, ptrWidth, 0)}});
      // def->addInstance("wrPtr", "mantle.reg", mregArgs, zPtrInit);
      // def->addInstance("rdPtr", "mantle.reg", mregArgs, zPtrInit);

      def->addInstance("wrPtrp1", "coreir.add", pwArg);
      def->addInstance("rdPtrp1", "coreir.add", pwArg);

      Values zDataInit({{"init", Const::make(c, width, 0)}});

      def->addInstance("mem", "coreir.mem",
                       {{"width", Const::make(c, width)},
                        {"depth", Const::make(c, depth)}});

      // Connections

      // Wire clocks
      def->connect("self.clk", "wrPtr.clk");
      def->connect("self.clk", "rdPtr.clk");
      def->connect("self.clk", "mem.clk")

      def->connect("one.out", "wrPtrp1.in0");
      def->connect("wrPtr.out", "wrPtrp1.in1");

      def->connect("one.out", "rdPtrp1.in0");
      def->connect("rdPtr.out", "rdPtrp1.in1");

      def->connect("self.rst", "wrPtrRst.sel");
      def->connect("self.rst", "rdPtrRst.sel");
      def->connect("self.push", "wrPtrEn.sel");
      def->connect("self.pop", "rdPtrEn.sel");

      def->connect("wrPtr.out", "wrPtrEn.in0");
      def->connect("rdPtr.out", "rdPtrEn.in0");
      def->connect("wrPtrp1.out", "wrPtrEn.in1");
      def->connect("rdPtrp1.out", "rdPtrEn.in1");
      def->connect("wrPtrEn.out", "wrPtrRst.in0");
      def->connect("rdPtrEn.out", "rdPtrRst.in0");
      def->connect("zero.out", "wrPtrRst.in1");
      def->connect("zero.out", "rdPtrRst.in1");
      def->connect("wrPtrRst.out", "wrPtr.in");
      def->connect("rdPtrRst.out", "rdPtr.in");

      // Connect the rest of the memory
      def->connect("self.data_in", "mem.wdata");
      def->connect("wrPtr.out", "mem.waddr");
      def->connect("self.push", "mem.wen");
      def->connect("self.data_out", "mem.rdata");
      def->connect("rdPtr.out", "mem.raddr");


      // full and empty instances
      def->addInstance("emptyEq", "coreir.eq", pwArg);
      def->addInstance("fullCalc", "coreir.and", {{"width", Const::make(c, 1)}});
      def->addInstance("fullEq_1", "coreir.eq", {{"width", Const::make(c, 1)}});
      def->addInstance("fullEq_2", "coreir.eq", {{"width", Const::make(c, ptrWidth - 1)}});
      def->addInstance("rdPtrSlice", "coreir.slice", {{"width", Const::make(c, ptrWidth)}, {"hi", Const::make(c, ptrWidth - 1)}, {"lo", Const::make(c, 0)}});
      def->addInstance("wrPtrSlice", "coreir.slice", {{"width", Const::make(c, ptrWidth)}, {"hi", Const::make(c, ptrWidth - 1)}, {"lo", Const::make(c, 0)}});
      def->addInstance("notfullEq_1", "coreir.not", {{"width", Const::make(c, 1)}});

      // full and empty connections
      def->connect("rdPtr.out", "emptyEq.in0");
      def->connect("wrPtr.out", "emptyEq.in1");
      def->connect("rdPtr.out", "rdPtrSlice.in");
      def->connect("wrPtr.out", "wrPtrSlice.in");
      Instance * rdPtr = def->getInstances().at("rdPtr");
      Instance * wrPtr = def->getInstances().at("wrPtr");
      Instance * fullEq_1 = def->getInstances().at("fullEq_1");
      def->connect(rdPtr->sel("out")->sel(ptrWidth - 1), fullEq_1->sel("in0")->sel(0));
      def->connect(wrPtr->sel("out")->sel(ptrWidth - 1), fullEq_1->sel("in1")->sel(0));
      def->connect("rdPtrSlice.out", "fullEq_2.in0");
      def->connect("wrPtrSlice.out", "fullEq_2.in1");
      def->connect("fullEq_1.out", "notfullEq_1.in.0");
      def->connect("notfullEq_1.out", "fullCalc.in0");
      def->connect("fullEq_2.out", "fullCalc.in1.0");

      def->connect("emptyEq.out", "self.empty");
      def->connect("fullCalc.out.0", "self.full");


  });
  return global;
  }
