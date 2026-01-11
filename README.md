# Parameterized Digital System using Verilog (Week 1)

## Overview
This project implements a simple digital system in **Verilog**, developed as a Week 1 baseline.  
It focuses on understanding and implementing the **separation of control and datapath**, a core concept in digital system design.

The system consists of:
- A parameterized ALU (datapath)
- A finite state machine (control unit)
- A top-level module integrating both

At the end of Week 1, the design is **functionally correct, simulated, and verified using waveforms**.

---

## Design Components

### ALU (Datapath)
- Parameterized data width
- Supported operations:
  - ADD, SUB
  - AND, OR, XOR
  - SHIFT LEFT, SHIFT RIGHT
  - ZERO output
- Generates status flags:
  - Zero
  - Carry
  - Negative
- Fully combinational implementation

---

### FSM Controller (Control Unit)
- Moore finite state machine
- States:
  - IDLE
  - LOAD
  - EXECUTE
  - DONE
- Sequences operations across clock cycles
- Clean reset behavior
- Control outputs are mutually exclusive

---

### Top Module
- Integrates the FSM and ALU
- Exposes a system-level interface
- `done` signal indicates when the ALU output is considered valid
- Structural integration only (no additional datapath logic)

---

## Verification (Week 1 Scope)

Verification is performed using **separate testbenches** for each module:

### ALU Verification
- Arithmetic and logical operations tested
- Flag behavior observed
- Boundary values checked
- Verified using GTKWave

### FSM Verification
- Reset behavior verified
- Correct state sequencing confirmed
- Single-cycle assertion of control signals verified

### Top-Level Verification
- End-to-end control and datapath flow verified
- `done` signal timing validated
- ALU output correctness checked when `done` is asserted

Waveforms (`.vcd` files) were generated and inspected to confirm correct behavior.

---

## Tools Used
- Icarus Verilog (simulation)
- GTKWave (waveform analysis)

---

## How to Run (Top-Level Simulation)

```bash
iverilog -o top_tb.out src/*.v tb/top_module_tb.v
vvp top_tb.out
gtkwave top_module.vcd
