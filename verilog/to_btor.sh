yosys -l yosys.log -p 'read_verilog -sv -formal Scoreboard.sv; hierarchy -check; proc; memory -nomap; opt; prep -top Scoreboard; check -assert; flatten; opt; write_btor Scoreboard.btor'
