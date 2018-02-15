# Verilog Flow Instructions
## Yosys Installation for Ubuntu
To use Verific frontend, see the optional Yosys-Verific installation instructions.
```
sudo apt-get install build-essential clang bison flex \
	libreadline-dev gawk tcl-dev libffi-dev git mercurial \
	graphviz xdot pkg-config python3
git clone https://github.com/YosysHQ/yosys.git
cd yosys
make
sudo make install
```
See the Yosys [repository](https://github.com/YosysHQ/yosys) for more instructions.

## CVC4 Installation for Ubuntu
```
sudo apt-get install autoconf libgmp3-dev
git clone https://github.com/CVC4/CVC4.git
cd CVC4
./contrib/get-antlr-3.4
./autogen.sh
# For this project, using the following configuration
./configure production-staticbinary --disable-shared
make
sudo make install
```

## (optional) SymbiYosys for Ubuntu
This library is used for model checking with Yosys and ABC.
```
git clone https://github.com/YosysHQ/SymbiYosys.git
cd SymbiYosys
make
sudo make install
```

## (optional) Yosys with Verific Frontend
Make sure you have all of the Yosys dependencies (see above).
Then, edit the top of the Makefile (or use a Makefile.conf) to look as follows:
```
# CONFIG := clang
CONFIG := gcc
# CONFIG := gcc-4.8
# CONFIG := emcc
# CONFIG := mxe
# CONFIG := msys2

# features (the more the better)
ENABLE_TCL := 0
ENABLE_ABC := 1
ENABLE_PLUGINS := 0
ENABLE_READLINE := 1
ENABLE_EDITLINE := 0
ENABLE_VERIFIC := 1
ENABLE_COVER := 1
ENABLE_LIBYOSYS := 0
```

Additionally further down in the Makefile you will need to update the following:
```
VERIFIC_DIR ?= <your path to verific>/verific_lib_eval/
VERIFIC_COMPONENTS ?= verilog vhdl database util containers hier_tree hdl_file_sort database verilog_nl commands
```

Then simply run `make` and `make install` as usual.

## Running model checking queries
You can run ```./check.sh cvc4``` from the verilog directory which will do a bounded model checking run for 30 cycles.

More detailed instructions coming soon...