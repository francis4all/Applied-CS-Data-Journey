# Image Processing via Linear Algebra

## Overview
This project demonstrates the power of **Matrix Operations** in digital image processing. Treating images as high-dimensional matrices (Tensors), we apply Linear Algebra concepts to manipulate visual data at the pixel level without relying on high-level "black-box" editing tools.

## Mathematical Concepts
The core idea is treating an image not as a file, but as a numeric tensor of shape $(H, W, C)$.

1.  **Matrix Representation:**
    * A grayscale image is a matrix $A \in \mathbb{R}^{m \times n}$.
    * A color image is a tensor of stacked matrices (Red, Green, Blue channels).
2.  **Singular Value Decomposition (SVD):**
    * We decompose the image matrix into $A = U \Sigma V^T$.
    * **Compression:** By keeping only the top $k$ singular values in $\Sigma$, we can reconstruct a compressed version of the image that retains the most structurally significant information (Low-Rank Approximation).
3.  **Linear Transformations:**
    * Applying scalar multiplication for brightness adjustments.
    * Matrix addition for masking.

## Tech Stack
* **Python 3.10**
* **NumPy:** The engine for all matrix manipulations (SVD, Dot Products).
* **Matplotlib:** Used for rendering the matrix arrays back into visual data.

## How to Run

1.  **Prerequisites:**
    Ensure you have an image file (e.g., `.jpg` or `.png`) inside the `figures/` directory.

2.  **Install dependencies:**
    ```bash
    pip install -r requirements.txt
    ```

3.  **Run the notebook:**
    ```bash
    jupyter notebook notebooks/image_processing.ipynb
    ```