@echo off
REM ****************************************************************************
REM Vivado (TM) v2018.3.1 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Fri Sep 30 17:26:08 +0200 2022
REM SW Build 2489853 on Tue Mar 26 04:20:25 MDT 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
call xsim PMODI2S2_user_behav -key {Behavioral:sim_1:Functional:PMODI2S2_user} -tclbatch PMODI2S2_user.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
