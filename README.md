# **Channel Coding Analysis: Binary Asymmetric Channel (BAC) and Gaussian Channel**
This MATLAB project explores the **optimization of input distributions** for two communication channels—**Binary Asymmetric Channel (BAC)** and **Gaussian Channel**—to maximize mutual information and channel capacity.

---

## **Project Overview**
- **Binary Asymmetric Channel (BAC)**: Simulates a communication channel where the probability of bit flipping is asymmetric.
- **Gaussian Channel**: Models a communication channel with Gaussian noise, optimizing for capacity.

---

## **Project Structure**

---

## **Implementation Details**

### **1. Binary Asymmetric Channel (BAC)**
- **Channel Parameters**:
  - Probability of flipping **0 to 1**: `e0 = 0.1`
  - Probability of flipping **1 to 0**: `e1 = 0.3`
  - **Transition Matrix**: 
    \[
    P_{tran} = \begin{bmatrix} 1 - e0 & e0 \\ e1 & 1 - e1 \end{bmatrix}
    \]

- **Optimization**:
  - Initial **input distribution**: `[0.5, 0.5]`
  - Iteratively updates using **gradient ascent** to maximize **mutual information**.
  - **Stopping criteria**: Convergence when changes fall below a set tolerance (`tolerance = 1e-6`).

- **Outputs**:
  - Iterative **mutual information** values.
  - **Optimized input distribution** for maximum mutual information.

### **2. Gaussian Channel**
- **Channel Parameters**:
  - **Mean**: `0`
  - **Variance**: `1`
  - **Input values**: `x_gaussian = -4:1:4`

- **Optimization**:
  - Initial **Gaussian input distribution**.
  - Iteratively optimizes input distribution to maximize **channel capacity**.
  - **Channel capacity formula**:
    \[
    C = 0.5 \log_2(1 + \text{variance})
    \]

- **Outputs**:
  - **Final optimized input distribution**.
  - **Calculated channel capacity**.

---

## **How to Run the Code**
1. **Open MATLAB** and navigate to the project directory.
2. **Run the script**:
   ```matlab
   channel_coding

