# Cross-Validation & Model Evaluation Strategy

## Overview
This project evaluates the robustness of supervised classification models using **Stratified K-Fold Cross-Validation**. The goal is to predict socioeconomic variables based on the *CIA World Factbook* dataset, comparing linear, tree-based, and instance-based algorithms while minimizing the variance bias associated with static train/test splits.

## The Science (Methodology)
To ensure metrics are statistically significant and robust:

1.  **Advanced Preprocessing:** * **Imputation:** Used `KNNImputer` to fill missing values based on nearest neighbor similarity (superior to simple mean/median imputation).
    * **Scaling:** Applied `StandardScaler` to normalize features, essential for distance-based algorithms like KNN.
2.  **Stratified K-Fold:** Rotating the training and validation sets to ensure every observation is tested exactly once while maintaining class balance.
3.  **Multi-Metric Evaluation:**
    * **Precision & Recall:** Critical for understanding Type I vs Type II errors.
    * **F1-Score:** The harmonic mean, used to penalize extreme values in unbalanced classes.

## Tech Stack
* **Python 3.10**
* **Data Manipulation:** `Pandas`, `OpenPyXL` (Excel ingestion).
* **Scikit-Learn (The Core):**
    * **Preprocessing:** `StandardScaler`, `KNNImputer`.
    * **Models:** `LogisticRegression`, `RandomForestClassifier`, `KNeighborsClassifier`.
    * **Validation:** `StratifiedKFold`, `cross_validate` (for multi-metric scoring).
* **Metrics:** `make_scorer`, `accuracy`, `precision`, `recall`, `f1`.

## How to Run
1.  Install dependencies:
    ```bash
    pip install -r requirements.txt
    ```
2.  Run the notebook:
    ```bash
    jupyter notebook notebooks/model_evaluation.ipynb
    ```