# Data Science Fundamentals

This directory consolidates foundational projects covering the essential Data Science pipeline: data wrangling, automated web scraping, and robust model evaluation metrics.

## Project Overview

### 1. Titanic: Data Wrangling & Exploratory Analysis
* **Context:** A classic dataset analysis focusing on data quality and survival factors.
* **Key Achievements:**
    * Performed extensive data cleaning, including missing value imputation for 'Age' and 'Cabin' columns.
    * Conducted Exploratory Data Analysis (EDA) to visualize survival correlations with demographic features.
    * Engineered features to prepare the dataset for predictive modeling.
* **Notebook:** `notebooks/analysis_and_cleaning.ipynb`

### 2. Cross-Validation & Advanced Metrics
* **Context:** Moving beyond simple accuracy to evaluate model robustness using real-world data (CIA Countries dataset).
* **Key Achievements:**
    * Implemented **K-Fold Cross-Validation** to test model stability.
    * Analyzed classification performance using **Precision, Recall, and F1-Score**.
    * Demonstrated the importance of choosing the right metric for imbalanced classes.
* **Notebook:** `notebooks/model_evaluation.ipynb`

### 3. Web Scraping: Books Market Analysis
* **Context:** Automating the extraction of market data from an online bookstore.
* **Key Achievements:**
    * Built a scraper using **Requests** and **BeautifulSoup** to parse HTML content.
    * Extracted structured data (prices, titles, ratings) from unstructured web pages.
    * Transformed raw scraped data into a clean Pandas DataFrame for analysis.
* **Notebook:** `notebooks/books_market_analysis.ipynb`

## Tech Stack & Requirements

* **Data Manipulation:** Pandas, NumPy
* **Visualization:** Matplotlib, Seaborn
* **Scraping:** BeautifulSoup4, Requests
* **Machine Learning:** Scikit-Learn

## Usage Instructions

1. **Install Dependencies:**
   Ensure you have Python installed, then run:
   ```bash
   pip install -r requirements.txt
2. **Run the Notebooks:**
    You can explore any project by launching the Jupyter notebooks directly:
    ```bash
    jupyter notebook notebooks/