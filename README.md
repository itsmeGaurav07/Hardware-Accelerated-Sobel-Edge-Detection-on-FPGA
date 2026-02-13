# Hardware-Accelerated Sobel Edge Detection on FPGA

This project implements a real-time Sobel edge detection pipeline on the PYNQ-Z2 (Zynq-7000) FPGA using Verilog HDL.

The design performs streaming image processing using a 3×3 sliding window, Sobel convolution, and thresholding, and is deployed on hardware using Xilinx Vivado.

---

## 🔹 Features

- 3×3 sliding window generation using line buffers  
- Sobel gradient computation (Gx and Gy)  
- Edge magnitude calculation using signed arithmetic  
- Threshold-based binary edge detection  
- Hardware deployment on PYNQ-Z2 FPGA  
- Verified using onboard switches and LEDs  

---

## 🔹 Architecture

The processing pipeline is:


### Modules:
- `window_3x3.v` – Generates 3×3 pixel window  
- `sobel_core.v` – Computes Sobel gradients  
- `threshold.v` – Performs edge thresholding  
- `top.v` – Top-level integration  
- `pynq.xdc` – Pin constraints  

---

## 🔹 Tools & Technologies

- Verilog HDL  
- Xilinx Vivado 2022.2  
- FPGA (PYNQ-Z2 / Zynq-7000)  
- Digital Image Processing  

---

## 🔹 Hardware Setup

- Board: PYNQ-Z2 (XC7Z020CLG400-1)  
- Clock: 100 MHz onboard clock  
- Input: 8-bit switches (SW0–SW7)  
- Output: LEDs (LD0–LD3)  

---

## 🔹 How to Build

1. Open Xilinx Vivado  
2. Create a new RTL project  
3. Add all `.v` files and `pynq.xdc`  
4. Set `top.v` as top module  
5. Run Synthesis → Implementation → Generate Bitstream  
6. Program the board using Hardware Manager  

---

## 🔹 How to Test on Board

1. Program the FPGA  
2. Press Reset button  
3. Change switch values  
4. Observe LEDs  

| LED | Function |
|-----|----------|
| LED0 | Edge detected |
| LED1 | Data valid |
| LED2 | Debug |
| LED3 | Debug |

---

## 🔹 Example Input

| Switch Pattern | Result |
|---------------|---------|
| 00000000 | No edge |
| 11111111 | Strong edge |
| 01010101 | Edge detected |

---

## 🔹 Future Improvements

- Camera input integration  
- VGA/HDMI display output  
- AXI interface to ARM processor  
- Dynamic threshold control  

---

## 🔹 Author

**Gaurav Sai**  
Electronics & Communication Engineering  
Interested in VLSI and FPGA Design


