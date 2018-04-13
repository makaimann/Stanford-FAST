#include <string>
#include <iostream>
#include <sstream>
#include <math.h>
#include "coreir.h"
#include "mux.h"

using namespace CoreIR;
using namespace std;

int main() {
  Context *c = newContext();
  Namespace *global = c->getGlobal();

  // Load utils
  CoreIRUtils(c);

  Params fifoParams({{"width", c->Int()}, {"depth", c->Int()}});

  TypeGen *fifoTypeGen = global->newTypeGen(
      "FIFOTypeGen",
      fifoParams,
      [](Context *c, Values args) {
        Value *widthArg = args.at("width");
        uint width = widthArg->get<int>();

        return c->Record({
            {"clk", c->Named("coreir.clkIn")},
            {"rst", c->Named("coreir.arstIn")},
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
      uint ptrWidth = static_cast<uint>(log2(depth) + 0.5);

      Values wArg({{"width", Const::make(c, width)}});
      Values pwArg({{"width", Const::make(c, ptrWidth)}});
      Values mregArgs({{"width", Const::make(c, ptrWidth)},{"has_en", Const::make(c, true)},{"has_rst", Const::make(c, true)}});
      Values zPtrInit({{"init", Const::make(c, ptrWidth, 0)}});

      def->addInstance("one", "coreir.const", pwArg, {{"value", Const::make(c, ptrWidth, 1)}});

      def->addInstance("wrPtr", "mantle.reg", mregArgs, zPtrInit);
      def->addInstance("rdPtr", "mantle.reg", mregArgs, zPtrInit);

      def->addInstance("wrPtrp1", "coreir.add", pwArg);
      def->addInstance("rdPtrp1", "coreir.add", pwArg);

      Values zDataInit({{"init", Const::make(c, width, 0)}});

      ostringstream oss;
      for (uint i = 0; i < depth; ++i) {
        oss << i;
        def->addInstance("entry" + oss.str(), "mantle.reg", {{"width", Const::make(c, width)}, {"has_en", Const::make(c, true)}}, zDataInit);
        def->addInstance("entryEn" + oss.str(), "coreir.eq", pwArg);
        ostringstream().swap(oss);
      }

      // Connections
      def->connect("one.out", "wrPtrp1.in0");
      def->connect("wrPtr.out", "wrPtrp1.in1");

      def->connect("one.out", "rdPtrp1.in0");
      def->connect("rdPtr.out", "rdPtrp1.in1");

      def->connect("self.rst", "wrPtr.rst");
      def->connect("self.rst", "rdPtr.rst");
      def->connect("self.clk", "wrPtr.clk");
      def->connect("self.clk", "rdPtr.clk");

      def->connect("self.push", "wrPtr.en");
      def->connect("self.pop", "rdPtr.en");

      // Mux for data_out
      Namespace *util = c->getNamespace("util");
      Generator *paraMux = util->getGenerator("paraMux");
      string mux = "data_out_mux";
      def->addInstance(mux, paraMux,
                       {{"width", Const::make(c, width)},
                        {"num", Const::make(c, depth)}});

      for (uint i = 0; i < depth; ++i) {
        oss << i;
        string entry = "entry" + oss.str();
        string entryEn = "entryEn" + oss.str();
        string con = "const_" + oss.str();

        def->addInstance(con, "coreir.const", pwArg, {{"value", Const::make(c, ptrWidth, i)}});

        def->connect("self.data_in", entry + ".in");
        def->connect(entryEn + ".out", entry + ".en");
        def->connect("wrPtr.out", entryEn + ".in0");
        def->connect(con + ".out", entryEn + ".in1");

        string rdPtrEn = "rdPtrEn_" + oss.str();
        def->addInstance(rdPtrEn, "coreir.eq", {{"width", Const::make(c, ptrWidth)}});
        def->connect("rdPtr.out", rdPtrEn + ".in0");
        def->connect(con + ".out", rdPtrEn + ".in1");

        // connect mux
        string in = ".in" + oss.str();
        string sel = ".sel" + oss.str();
        def->connect(entry + ".out", mux + in);
        def->connect(rdPtrEn + ".out", mux + sel);

        ostringstream().swap(oss);
      }

      // connect mux to data out
      def->connect(mux + ".out", "self.data_out");

  });

  Module* top = global->newModuleDecl("top", c->Record({}));
  ModuleDef* topdef = top->newModuleDef();
  topdef->addInstance("f", "global.fifo",
                      {{"width", Const::make(c, 8)},
                       {"depth", Const::make(c, 8)}});

  top->setDef(topdef);
  fifo->print();
  top->print();

  Instance* f = topdef->getInstances().at("f");

  c->runPasses({"rungenerators"});

  Module *fModuleRef = f->getModuleRef();
  cout << "Printing the generated module!" << endl;
  fModuleRef->print();

  saveToFile(global, "fifo.json", top);
  deleteContext(c);
  return 0;
}
