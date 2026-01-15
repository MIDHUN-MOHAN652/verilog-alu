# Parameterized Digital System using Verilog  
## Week 2 – Day 1 (Verification Focus)

## Overview
This project implements a parameterized digital system in **Verilog**, consisting of a datapath (ALU) and a control unit (FSM), integrated through a top-level module.

Week 1 focused on **design and integration**.  
Week 2 shifts focus to **verification depth and correctness assurance**.

The goal is not to add features, but to **prove existing logic behaves correctly under multiple conditions**.

---

## Architecture Summary
The system is composed of three main blocks:

- **ALU (Datapath)** – performs arithmetic and logical operations
- **FSM Controller (Control Unit)** – sequences operations across clock cycles
- **Top Module** – integrates control and datapath

This README reflects the state of the project at **Week 2, Day 1**, with emphasis on ALU verification.

---

## ALU (Datapath)
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

## Verification Progress

### Self-Checking ALU Verification (Week 2 – Day 1)
The ALU is verified using a **self-checking testbench**, removing dependence on manual waveform inspection.

Key characteristics:
- Expected results computed inside the testbench
- Automatic comparison against DUT output
- Clear PASS / FAIL reporting
- Boundary and overflow cases included

The testbench validates:
- Arithmetic correctness
- Logical operations
- Shift operations
- Carry propagation
- Correct handling of edge cases

This establishes a reliable baseline before deeper system-level verification.

---

## Testbenches
- `alu_selfcheck_tb.v` – self-checking ALU testbench (primary focus)
- `alu_tb.v` – basic ALU waveform-based testbench (legacy)
- FSM and top-level testbenches retained for future verification stages

---

## Tools Used
- Icarus Verilog (simulation)
- GTKWave (waveform analysis when required)

---
