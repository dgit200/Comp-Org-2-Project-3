@echo off
set xv_path=C:\\Users\\DwightThomas\\Desktop\\Vivado\\2015.4\\bin
call %xv_path%/xsim ALU4Bit_tb_behav -key {Behavioral:sim_1:Functional:ALU4Bit_tb} -tclbatch ALU4Bit_tb.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
