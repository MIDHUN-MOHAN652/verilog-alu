## Verification Summary

Verification was performed incrementally at three levels:

### ALU Verification
- Self-checking testbench used to validate arithmetic and logical operations
- Boundary cases (overflow, underflow, zero result) tested
- Carry, Zero, and Negative flags observed
- PASS/FAIL reporting used instead of manual waveform inspection

### FSM Verification
- Dedicated abuse testbench used
- FSM tested under:
  - Prolonged `start` assertion
  - Back-to-back `start` pulses
  - `start` asserted during active operation
  - Reset asserted in non-IDLE states
- FSM confirmed to:
  - Never lock up
  - Never overlap control outputs
  - Always return to IDLE after DONE

### System-Level Verification
- Top module tested under realistic and abusive conditions
- Verified:
  - One `done` pulse per valid operation
  - Clean behavior under `start` spam
  - Proper reset handling during operation
- Waveforms generated and inspected to confirm correct sequencing and timing

## Known Limitations

- In the baseline top module, inputs are not registered.
  - If input signals change while the FSM is active, the ALU output may reflect the latest inputs.
  - This behavior is expected and documented.

- Output stability is guaranteed only when the `done` signal is asserted.
  - Output behavior outside this window is not constrained.

- The design does not include:
  - Input/output buffering
  - Pipelining
  - Error handling for invalid ALU operation codes

These limitations are intentional and serve as motivation for future extensions rather than indicating incorrect behavior.
