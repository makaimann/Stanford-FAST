#include <string>
#include <iostream>
#include <sstream>
#include "coreir.h"
#include <map>

using namespace std;

Namespace * CoreIRUtils(Context *c) {
  Namespace *util= c->newNamespace("util");
  Params muxparams = Params({{"width", c->Int()}, {"num", c->Int()}});

  TypeGen *replicateTypeGen = util->newTypeGen(
        "ReplicateTypeGen",
        Params({{"num", c->Int()}}),
        [](Context *c, Values args) {
          uint num = args.at("num")->get<int>();
          return c->Record({{"in", c->BitIn()},
                            {"out", c->Bit().Arr(num)}});
        });

  Generator *replicate = util->newGeneratorDecl("replicate", replicateTypeGen, {{"num", c->Int()}});
  paraMux->setGeneratorDefFromFun([](Context *c, Values args, ModuleDef *def) {
      uint num = args.at("num")->get<int>();
      def->addInstance("concat_1", {{"width0", Const::make(c, 1)}, {"width1", Const::make(c, 1)}});
      def->connect("concat_1.in0", "self.in");
      def->connect("concat_1.in1", "self.in");
      string prevname = "concat_1";

      ostringstream oss;
      for(uint i = 2; i < num; i=2*i) {
        oss << i;
        string c = "concat_" + oss.str();
        def->addInstance(c, {{"width0", Const::make(c, i)}, {"width1", Const::make(c, i)}});
        def->connect(prevname + ".out", c + ".in0");
        def->connect(prevname + ".out", c + ".in1");
        prevname = c;
        ostringstream().swap(oss);
      }

      if (num % 2 == 1) {
        def->addInstance("concat_1p", {{"width0", Const::make(c, num - 1)}, {"width1", Const::make(c, 1)}});
        def->connect(prevname + ".out", "concat_1p.in0");
        def->connect("self.in", "concat_1p.in1");
        def->connect("concat_1p.out", "self.out");
      }
      else {
        def->connect(prevname + ".out", "self.out");
      }
    });

  TypeGen *paraMuxTypeGen = util->newTypeGen(
     "ParaMuxTypeGen",
     muxparams,
     [](Context *c, Values args) {
       uint width = args.at("width")->get<int>();
       uint num = args.at("num")->get<int>();
       Type intype = c->BitIn()->Arr(width);
       map<string, Type*> interface;

       ostringstream oss;
       for (uint i = 0; i < num; ++i) {
         oss << i;
         string n = "in" + oss.str();
         string sel = "sel" + oss.str();
         ostringstream().swap(oss);
         interface[n] = intype;
         interface[sel] = c->BitIn();
       }
       interface["out"] = c->Flip(intype);
       return c->Record(interface);
     });

  Generator *paraMux = util->newGeneratorDecl("paraMux", paraMuxTypeGen, muxparams);
  paraMux->setGeneratorDefFromFun([](Context *c, Values args, ModuleDef *def) {
      uint width = args.at("width")->get<int>();
      uint num = args.at("num")->get<int>();

      ostringstream oss;
      for (uint i = 0; i < num; ++i) {
        oss << i;
        string and = "and_" + oss.str();
        string repl = "repl_" + oss.str();
        string sel = "self.sel" + oss.str();
        string in = "self.in" + oss.str();

        def->addInstance(and, "coreir.and", {{"width", Const::make(c, width)}});
        // TODO
        // Extend the select bit and then AND with the corresponding in value
        Generator *replicate = util->getGenerator("replicate");
        def->addInstance(repl, replicate, {{"num", Const::make(c, width)}});
        def->connect(sel, repl + ".in");
        def->connect(repl + ".out", and + ".in0");
        def->connect(in, and + ".in1");
        ostringstream().swap(oss);
      }

      // Now do a chain of ors on all the and outputs
      def->addInstance("or_chain_1", "coreir.or", {{"width", Const::make(c, width)}});
      def->connect("and_0.out", "or_chain1.in0");
      def->connect("and_1.out", "or_chain1.in1");
      string prevname = "or_chain_0";
      for (uint i = 2; i < num; ++i) {
        oss << i;
        string and = "and_" + oss.str();
        string or = "or_chain_" + oss.str();
        def->connect(and + ".out", or + ".in0");
        def->connect(prevname + ".out", or + ".in1");
        prevname = or;
        ostringstream().swap(oss);
      }
      // Connect to interface output
      def->connect(prevname + ".out", "self.out");
    });

  return util;
}
