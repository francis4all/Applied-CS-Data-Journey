# Mathematical Foundations for AI

This module explores the core mathematical concepts that power modern Artificial Intelligence and Computer Vision. It bridges the gap between abstract theory and practical implementation using Python.

## Project Overview

### 1. Image Processing & Linear Algebra
* **Context:** Images are essentially multi-dimensional matrices. This project applies Linear Algebra concepts to manipulate and analyze visual data.
* **Key Concepts:**
    * **Matrix Operations:** Understanding channels, pixel manipulation, and transformations.
    * **Kernels & Filters:** Applying convolution principles for edge detection and blurring.
    * **Color Spaces:** Manipulating RGB and grayscale tensors.
* **Notebook:** [`notebooks/image_processing.ipynb`](./notebooks/image_processing.ipynb)

### 2. Calculus: Interactive Tangent Visualizer
* **Context:** Understanding derivatives is crucial for grasping optimization algorithms like **Gradient Descent**.
* **Key Concepts:**
    * **Derivatives:** Visualizing the rate of change at a specific point.
    * **Tangent Lines:** Geometric interpretation of the derivative.
    * **Optimization:** Intuition behind finding minima/maxima in functions.
* **Tech Stack:** Python, Matplotlib, and **PyQt5** for the Graphical User Interface (GUI).
* **Source Code:** [`src/visualizer.py`](./src/visualizer.py)

![Math Visualizer Demo](./images/Figure_1.png)

## Usage

1. **Install Dependencies:**
   ```bash
   pip install -r requirements.txt
2. **Run the Projects:**
    - **For Image Processing:** Open the notebook in Jupyter:
        ```bash
        jupyter notebook notebooks/image_processing.ipynb
    - **For the Visualizer:** Run the Python script directly (requires a desktop environment for the GUI window):
        ```bash
        python src/visualizer.py

---
*Developed as part of my Applied CS Data Journey | ENES Morelia, UNAM.*