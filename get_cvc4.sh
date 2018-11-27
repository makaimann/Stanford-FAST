#!/bin/bash

NOTICE="
=====================================================================================\n
This is a convenience script meant to aid in setting up CVC4 with the best configuration\n
for hardware model checking. Do not rely on this script in any way, and review\n
the CVC4 license before use: https://github.com/CVC4/CVC4/blob/master/COPYING\n
=====================================================================================\n\n"

echo -e $NOTICE

git clone https://github.com/CVC4/CVC4.git
cd CVC4

echo "Getting ANTLR, CaDiCaL, and cryptominisat"
./contrib/get-antlr-3.4 && ./contrib/get-cadical && ./contrib/get-cryptominisat

echo "Configuring CVC4 with best options for hardware verification"
./configure.sh production --static --cadical --cryptominisat

cd build

make -j$(nproc)

cd ../

echo ""
echo "The static binary is available at ./CVC4/builds/bin/"
