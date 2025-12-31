# Web Scraping & Market Analysis Pipeline

## Overview
This project implements an automated **ETL (Extract, Transform, Load)** pipeline to harvest, clean, and analyze product data from a mock e-commerce bookstore (*Books to Scrape*). 

The goal was not only to extract data but to test a statistical hypothesis: **"Does the price of a book correlate with its user rating?"**

## The Pipeline

### 1. Extraction (Web Scraping)
* **Target:** Iterated through **50 paginated URLs** to scrape the full catalog (1000 books).
* **Tooling:** Used `urllib` for HTTP requests and `BeautifulSoup4` for DOM parsing.
* **Robustness:** Implemented `try-except` blocks to handle potential `HTTPError` or `URLError` during network requests.

### 2. Transformation (Data Cleaning)
Raw HTML data was unstructured. The following processing was applied:
* **Regex Cleaning:** Stripped currency symbols (`£`) and converted price strings to `float`.
* **Mapping:** Converted text-based ratings (e.g., "Three") to numeric integers (3) using a dictionary mapping.
* **Structuring:** Consolidated data into a `Pandas DataFrame`.

### 3. Analysis (EDA)
* **Visualizations:** Generated Histograms and Boxplots using `Matplotlib` and `Seaborn` to understand price distributions.
* **Hypothesis Testing:** Calculated the **Spearman Rank Correlation** coefficient.

## Key Findings
* The analysis revealed a correlation coefficient near **0**.
* **Conclusion:** There is **no monotonic relationship** between the price of a book and its rating. Expensive books do not guarantee higher ratings, nor do cheap books imply poor quality.

## Tech Stack
* **Python 3.10**
* **Data Acquisition:** `BeautifulSoup4`, `urllib`, `RegEx`.
* **Analysis:** `Pandas`, `SciPy` (Spearman test).
* **Visualization:** `Matplotlib`, `Seaborn`.

## How to Run
1.  **Install dependencies:**
    ```bash
    pip install -r requirements.txt
    ```
2.  **Run the notebook:**
    ```bash
    jupyter notebook notebooks/books_market_analysis.ipynb
    ```