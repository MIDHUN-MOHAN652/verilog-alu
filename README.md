# Parameterized Digital System using Verilog  
## Week 2 – Day 2 (FSM Robustness Verification)

## Overview
This project implements a parameterized digital system in **Verilog**, consisting of:
- A datapath (ALU)
- A control unit (FSM)
- A top-level module integrating both

Week 1 focused on **design, integration, and basic verification**.  
Week 2 focuses on **robustness and verification under non-ideal conditions**.

This README reflects the project state at **Week 2 – Day 2**, with emphasis on **FSM stress testing**.

---

## Architecture Summary
The system is built around a clear separation of responsibilities:

- **ALU (Datapath)**  
  Performs arithmetic and logical operations.

- **FSM Controller (Control Unit)**  
  Sequences operations across clock cycles using defined states.

- **Top Module**  
  Integrates control and datapath and exposes a system-level interface.

The architecture is intentionally simple to allow focused verification.

---

## FSM Controller
- Moore finite state machine
- States:
  - IDLE
  - LOAD
  - EXECUTE
  - DONE
- Clean synchronous behavior
- Reset forces IDLE state
- Control outputs (`load`, `execute`, `done`) are mutually exclusive

---

## Verification Progress

### FSM Abuse and Robustness Testing (Week 2 – Day 2)
The FSM is verified using an **abuse-style testbench**, where inputs are intentionally applied in invalid or unexpected ways.

Test scenarios include:
- `start` held high for multiple cycles
- `start` asserted while FSM is already busy
- Back-to-back
