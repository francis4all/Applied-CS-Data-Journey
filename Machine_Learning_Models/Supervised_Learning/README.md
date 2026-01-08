# Supervised Learning Lab

This directory contains predictive modeling projects leveraging labeled datasets. The work is divided into two main domains: **Natural Language Processing (NLP)** for unstructured text analysis and **Tabular Classification** for structured medical data.

## Project Overview

### 1. NLP: Text Classification & Sentiment Analysis
* **Context:** Processing unstructured text to determine underlying sentiment and emotion.
* **Projects:**
    * **Movie Reviews Sentiment (Naive Bayes):** Implemented a probabilistic Multinomial Naive Bayes classifier. Key steps included text vectorization (CountVectorizer) and stop-word removal using NLTK.
    * **Tweet Emotion Detection (SVM):** Applied Support Vector Machines (LinearSVC) to classify tweets into multiple emotional categories. This project demonstrates handling high-dimensional sparse data effectively.
* **Notebooks:**
    * `notebooks/movie_reviews_naive_bayes.ipynb`
    * `notebooks/tweet_emotion_svm.ipynb`

### 2. Tabular: Medical Diagnosis (Binary Classification)
* **Context:** Predicting the survival outcome of horses with colic based on medical parameters. This dataset is notable for containing a significant amount of missing data, requiring robust preprocessing.
* **Projects:**
    * **Logistic Regression:** Established a probabilistic baseline model to interpret the relationship between clinical features and survival probability.
    * **Support Vector Machines (SVM):** Implemented a robust classifier to handle non-linear decision boundaries and improve prediction accuracy on the medical dataset.
* **Notebooks:**
    * `notebooks/horse_colic_LogReg.ipynb`
    * `notebooks/horse_colic_SVM.ipynb`

## Usage Instructions

1. **Install Dependencies:**
   ```bash
   pip install -r requirements.txt
2. **NLTK Setup:**
Some NLP notebooks require specific NLTK corpora. If you encounter and error, run this inside Python:
    ```python
    import nltk
    nltk.download('stopwords')
    nltk.download('punkt')
3. **Run the Notebooks:**
Launch Jupyter to explore the code:
    ```bash
    jupyter notebook notebooks/