# CRC Generator in Verilog

## Overview

This project implements a CRC (Cyclic Redundancy Check) Generator using
Verilog HDL. CRC is an error-detection technique used to detect accidental
changes or errors in digital data during transmission and storage.

The design generates a CRC value from an input data word using a predefined
generator polynomial.

## Features

- Verilog HDL implementation
- 8-bit input data
- 4-bit CRC output
- Configurable generator polynomial
- Testbench for functional verification
- Simulation waveform
- Expected simulation output

## CRC Configuration

This project uses:

- Data Width: 8 bits
- CRC Width: 4 bits
- Polynomial: x^4 + x + 1
- Polynomial Binary: 10011

## Inputs

| Signal | Width | Description |
|--------|-------|-------------|
| `clk` | 1 | System clock |
| `reset` | 1 | Reset signal |
| `data_in` | 8 | Input data |
| `start` | 1 | Starts CRC generation |

## Outputs

| Signal | Width | Description |
|--------|-------|-------------|
| `crc_out` | 4 | Generated CRC value |
| `done` | 1 | Indicates CRC generation is complete |

## Tools Used

- Verilog HDL
- ModelSim / Vivado / Icarus Verilog
- GTKWave

## Project Files

- `crc_generator.v` - CRC generator design
- `crc_generator_tb.v` - Testbench
- `simulation/waveform.png` - Simulation waveform
- `simulation/output.log` - Simulation output

## Simulation

The testbench applies different 8-bit data values to the CRC generator
and verifies the generated 4-bit CRC output.

