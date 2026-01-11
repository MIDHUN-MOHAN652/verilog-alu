# Parameterized Digital System using Verilog

## Overview
This project implements a simple digital system using Verilog, consisting of:
- A parameterized ALU (datapath)
- A finite state machine (control unit)
- A top-level module integrating both

The design demonstrates separation of control and datapath, a core concept in digital system design.

## Modules
### ALU
- Parameterized data width
- Supports arithmetic and logical operations
- Generates Zero, Carry, and Negative flags

### FSM Controller
- Moore FSM
- States: IDLE, LOAD, EXECUTE, DONE
- Controls operation sequencing

### Top Module
- Integrates FSM and ALU
- Exposes `done` signal to indicate valid output

## Verification
- Individual testbenches for ALU,FSM and top_module
- Top-level testbench verifies full system flow
- Waveforms generated using GTKWave

## Tools Used
- Icarus Verilog
- GTKWave
