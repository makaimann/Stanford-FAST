COREIR_HOME = /Users/makaim/repos/coreir
CXX = clang++
CXXFLAGS = -std=c++11
INCLUDE_FLAGS = -I./ -I$(COREIR_HOME)/include
LDLIB_FLAGS = -L$(COREIR_HOME)/lib
LIB_FLAGS = -lcoreir

scoreboard:
	$(CXX) $(CXXFLAGS) scoreboard.cpp -o scoreboard.out $(INCLUDE_FLAGS) $(LDLIB_FLAGS) $(LIB_FLAGS)

scoreboard_array:
	$(CXX) $(CXXFLAGS) -DARRAY=1 scoreboard.cpp -o scoreboard_array.out $(INCLUDE_FLAGS) $(LDLIB_FLAGS) $(LIB_FLAGS)

scoreboard_arith:
	$(CXX) $(CXXFLAGS) scoreboard_arith.cpp -o scoreboard_arith.out $(INCLUDE_FLAGS) $(LDLIB_FLAGS) $(LIB_FLAGS)

scoreboard_arith_array:
	$(CXX) $(CXXFLAGS) -DARRAY=1 scoreboard_arith.cpp -o scoreboard_arith_array.out $(INCLUDE_FLAGS) $(LDLIB_FLAGS) $(LIB_FLAGS)

clean:
	rm *.json *.out || true
