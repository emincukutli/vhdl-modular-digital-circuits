# R=1/3 Convolutional Encoder VHDL Design & Simulation

## 📌 Project Overview
This project involves the design, finite state machine (FSM) analysis, and FPGA simulation of a **Constraint Length K=5, Coding Rate R=1/3 Convolutional Encoder** using VHDL in Xilinx Vivado. The system processes serial input data through shift registers and generates coded output streams ($C_1, C_2, C_3$) based on defined generator polynomials.

---

## ⚙️ Specifications & Generator Polynomials
* **Coding Rate (R):** 1/3
* **Constraint Length (K):** 5
* **Generator Polynomials:** 
  * $G_1 = [11101]$
  * $G_2 = [11010]$
  * $G_3 = [10111]$
* **Outputs:** CodeWord = $[C_1\ C_2\ C_3]$

---

## 📊 Key Implementation Stages
* **State Table & Transition Diagram:** Modeled a 16-state FSM ($S_0$ to $S_{15}$) representing shift register states and state transitions.
* **Hardware Architecture:** Designed logic circuit utilizing 4 D-Flip-Flops and XOR-based modulo-2 adders.
* **Testbench Verification:** Completed behavioral simulation on Xilinx Vivado confirming timing constraints and encoded outputs.
