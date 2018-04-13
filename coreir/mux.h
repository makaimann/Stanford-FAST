#include <string>
#include <iostream>
#include <sstream>
#include <math.h>
#include "coreir.h"
#include <utility>

using namespace CoreIR;
using namespace std;

Namespace * CoreIRUtils(Context *c) {
  Namespace * global= c->getGlobal();
  Params muxparams = Params({{"width", c->Int()}, {"num", c->Int()}});

  TypeGen *replicateTypeGen = global->newTypeGen(
        "ReplicateTypeGen",
        Params({{"num", c->Int()}}),
        [](Context *c, Values args) {
          uint num = args.at("num")->get<int>();
          return c->Record({{"in", c->BitIn()},
                            {"out", c->Bit()->Arr(num)}});
        });

  Generator *replicate = global->newGeneratorDecl("replicate", replicateTypeGen, {{"num", c->Int()}});
  replicate->setGeneratorDefFromFun([](Context *c, Values args, ModuleDef *def) {
      uint num = args.at("num")->get<int>();
      def->addInstance("concat_1", "coreir.concat", {{"width0", Const::make(c, 1)}, {"width1", Const::make(c, 1)}});
      def->connect("self.in", "concat_1.in0.0");
      def->connect("self.in", "concat_1.in1.0");
      string prevname = "concat_1";

      ostringstream oss;
      for(uint i = 2; i < num; i=2*i) {
        oss << i;
        string con = "concat_" + oss.str();
        def->addInstance(con, "coreir.concat", {{"width0", Const::make(c, i)}, {"width1", Const::make(c, i)}});
        def->connect(prevname + ".out", con + ".in0");
        def->connect(prevname + ".out", con + ".in1");
        prevname = con;
        ostringstream().swap(oss);
      }

      if (num % 2 == 1) {
        def->addInstance("concat_1p", "coreir.concat", {{"width0", Const::make(c, num - 1)}, {"width1", Const::make(c, 1)}});
        def->connect(prevname + ".out", "concat_1p.in0");
        def->connect("self.in", "concat_1p.in1");
        def->connect("concat_1p.out", "self.out");
      }
      else {
        def->connect(prevname + ".out", "self.out");
      }
    });

  TypeGen *paraMuxTypeGen = global->newTypeGen(
     "ParaMuxTypeGen",
     muxparams,
     [](Context *c, Values args) {
       uint width = args.at("width")->get<int>();
       uint num = args.at("num")->get<int>();
       Type *intype = c->BitIn()->Arr(width);

       vector<pair<string, Type*>> interface;

       ostringstream oss;
       for (uint i = 0; i < num; ++i) {
         oss << i;
         string n = "in" + oss.str();
         string sel = "sel" + oss.str();
         ostringstream().swap(oss);
         interface.push_back({n, intype});
         interface.push_back({sel, c->BitIn()});
       }
       interface.push_back({"out", c->Flip(intype)});
       return c->Record(interface);
     });

  Generator * paraMux = global->newGeneratorDecl("paraMux", paraMuxTypeGen, muxparams);
  paraMux->setGeneratorDefFromFun([](Context *c, Values args, ModuleDef *def) {

      Namespace *global = c->getNamespace("global");

      uint width = args.at("width")->get<int>();
      uint num = args.at("num")->get<int>();

      ostringstream oss;
      for (uint i = 0; i < num; ++i) {
        oss << i;
        string andstr = "and_" + oss.str();
        string repl = "repl_" + oss.str();
        string sel = "self.sel" + oss.str();
        string in = "self.in" + oss.str();

        def->addInstance(andstr, "coreir.and", {{"width", Const::make(c, width)}});
        // TODO
        // Extend the select bit and then AND with the corresponding in value
        Generator *replicate = global->getGenerator("replicate");
        def->addInstance(repl, replicate, {{"num", Const::make(c, width)}});
        def->connect(sel, repl + ".in");
        def->connect(repl + ".out", andstr + ".in0");
        def->connect(in, andstr + ".in1");
        ostringstream().swap(oss);
      }

      // Now do a chain of ors on all the and outputs
      def->addInstance("or_chain_1", "coreir.or", {{"width", Const::make(c, width)}});
      def->connect("and_0.out", "or_chain_1.in0");
      def->connect("and_1.out", "or_chain_1.in1");
      string prevname = "or_chain_1";
      for (uint i = 2; i < num; ++i) {
        oss << i;
        string andstr = "and_" + oss.str();
        string orstr = "or_chain_" + oss.str();
        def->addInstance(orstr, "coreir.or", {{"width", Const::make(c, width)}});
        def->connect(andstr + ".out", orstr + ".in0");
        def->connect(prevname + ".out", orstr + ".in1");
        prevname = orstr;
        ostringstream().swap(oss);
      }
      // Connect to interface output
      def->connect(prevname + ".out", "self.out");
    });

  return global;
}
