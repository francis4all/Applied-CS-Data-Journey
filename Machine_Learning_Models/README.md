# Machine Learning Models: Implementation & Theory

This module contains a comprehensive collection of Machine Learning implementations, ranging from classical supervised algorithms to advanced unsupervised techniques. Each sub-project focuses on solving specific real-world problems using a rigorous mathematical approach.

---

## Project Architecture

The models are categorized based on the learning paradigm and the nature of the data:

### 1. [Supervised Learning](./Supervised_Learning/)
Focuses on classification tasks using both tabular and unstructured text data.
* **Algorithms:** Logistic Regression, Support Vector Machines (SVM), Naive Bayes.
* **Key Projects:**
    * **Horse Colic Survival:** Predicting medical outcomes using tabular data and categorical encoding.
    * **NLP Sentiment Analysis:** Movie reviews classification and emotion detection in tweets.
* **Metrics:** Accuracy, Precision-Recall curves, and Confusion Matrices.

### 2. [Unsupervised Learning](./Unsupervised_Learning/)
Focuses on discovering hidden patterns and structures in unlabeled datasets.
* **Algorithms:** K-Means, Agglomerative Clustering (Hierarchical), NMF (Non-negative Matrix Factorization).
* **Key Projects:**
    * **Student Mental Health:** Clustering students based on depression and anxiety indicators.
    * **Market Basket Analysis:** Analyzing recipe ingredients for association rules.
    * **Topic Modeling:** Extracting themes from a corpus of magical spells.

---

## Global Tech Stack
* **Core:** Python 3.x, Scikit-Learn.
* **Data Handling:** Pandas, NumPy.
* **NLP:** NLTK, Scipy (Sparse matrices).
* **Visualization:** Seaborn, Matplotlib, Yellowbrick (for cluster evaluation).
* **Deployment (Beta):** Streamlit (used in Unsupervised Learning apps).

---

## Model Performance Highlights

| Model Type | Algorithm | Task | Key Metric |
| :--- | :--- | :--- | :--- |
| **Supervised** | SVM | Tweet Emotion | 0.82 F1-Score |
| **Supervised** | Naive Bayes | Movie Reviews | 0.85 Accuracy |
| **Unsupervised** | K-Means | Student Clustering | Silhouette Score: 0.45 |
| **Unsupervised** | NMF | Topic Modeling | 5 Distinct Themes |

---

## How to Navigate
1.  Navigate to either **Supervised** or **Unsupervised** folders.
2.  Each folder contains its own `data/`, `notebooks/`, and `requirements.txt`.
3.  Execute the notebooks in **Visual Studio Code** for the best interactive experience.

---
*Developed as part of my Applied CS Data Journey | ENES Morelia, UNAM.*