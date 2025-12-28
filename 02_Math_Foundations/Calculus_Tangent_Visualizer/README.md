# Interactive Tangent Line Visualizer

## Overview
This project is a computational implementation of **Differential Geometry** concepts. It provides an interactive environment to visualize the geometric relationship between a curve (specifically a circle) and its derivative at a specific point.

Unlike static graphing tools, this script accepts dynamic user parameters to construct the locus of points and calculates the instantaneous rate of change (slope) to render the tangent line in real-time.

## Mathematical Logic
The script bridges three key mathematical approaches:

1.  **Parametric Construction:**
    The circle is rendered not as a function $y=f(x)$, but using polar parameterization to ensure a closed loop:
    $$x = h + r \cdot \cos(\theta)$$
    $$y = k + r \cdot \sin(\theta)$$

2.  **Implicit Differentiation:**
    To find the tangent line, the script calculates the slope $m$ derived from the circle's equation $(x-h)^2 + (y-k)^2 = r^2$.
    The slope function implements:
    $$m = \frac{dy}{dx} = -\frac{x-h}{\sqrt{r^2 - (x-h)^2}}$$

3.  **Linear Approximation:**
    Using the calculated slope $m$ and the point of tangency $(x_0, y_0)$, the tangent line is projected using the Point-Slope form:
    $$y - y_0 = m(x - x_0)$$

## Tech Stack
* **Python 3.10**
* **NumPy:** For vectorized operations (`np.linspace`) and trigonometric calculations.
* **Matplotlib:** For rendering the Cartesian coordinate system, plotting vectors, and managing aspect ratios.

## Features & Edge Cases
* **Input Validation:** Ensures the radius $r > 0$.
* **Domain Checking:** Verifies if the requested $x$ coordinate lies within the feasible domain of the circle $[h, h+r]$.
* **Vertical Tangent Handling:** The code includes specific logic to handle the edge case where $x = h + r$, preventing "Division by Zero" errors and correctly plotting a vertical line.

## How to Run

1.  **Install dependencies:**
    ```bash
    pip install -r requirements.txt
    ```

2.  **Run the script:**
    ```bash
    python src/visualizer.py
    ```

3.  **Interactive Inputs:**
    The script will ask for inputs in the terminal. Example:
    * X coordinate of center ($h$): `0`
    * Y coordinate of center ($k$): `0`
    * Radius ($r$): `5`
    * Target X coordinate: `3`

    *Result: A window will open showing the circle centered at (0,0) with a tangent line touching at x=3.*
    <img src="images/Figure_1.png">
    