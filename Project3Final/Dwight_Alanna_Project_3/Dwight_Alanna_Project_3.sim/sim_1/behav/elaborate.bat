@echo off
set xv_path=C:\\Users\\DwightThomas\\Desktop\\Vivado\\2015.4\\bin
call %xv_path%/xelab  -wto 571db0155e0648e4932cee8bab8c0b54 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot ALU4Bit_tb_behav xil_defaultlib.ALU4Bit_tb xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
