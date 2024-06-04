# Traffic Light Controller System

## Project Overview
This project focuses on designing a traffic light control system for the intersection of a highway and a farm road. The primary aim is to develop a system using Verilog to manage traffic efficiently at the intersection, based on a Finite State Machine (FSM) approach.

## Design Details
- **Inputs**: The system includes three inputs: Clock (`CLK`), Reset (`RST`), and Go (`GO`).
- **Outputs**: It produces four 2-bit signals for the highway and farm roads (e.g., `highway_signal_1`, `highway_signal_2`, `farm_signal_1`, `farm_signal_2`), with signals indicating different states (Green, Yellow, Red, Red-Yellow).

### State Encoding
- `00`: Green
- `01`: Yellow (transition from Green)
- `10`: Red
- `11`: Red-Yellow (transition from Red)

## Features
- The system is designed to continuously rotate through the states based on the FSM, responding to the `RST` and `GO` inputs to manage state transitions.
- A detailed FSM is implemented to control the switching of the traffic lights with precision and efficiency.

## Implementation
- **Tools Used**: Aldec Active-HDL for simulation and Verilog for hardware description.
- **Modules**: Includes main traffic light controller module (`traffic_light_controller.v`) and test bench module for simulation verification (`traffic_light_controller_tb.v`).

## Simulation and Verification
- Extensive simulation tests were conducted to ensure the functionality of each state and transition.
- Verification includes checking the accuracy of state transitions and signal outputs under various test conditions.

## Future Enhancements
- **Sensor Integration**: Adding sensors to detect vehicle presence and adjust traffic light timings accordingly.
- **Performance Optimization**: Refining the FSM to reduce complexity and improve response times.

## How to Run
- Clone the repository.
- Open the project in Aldec Active-HDL.
- Run the simulation using the provided test bench.

