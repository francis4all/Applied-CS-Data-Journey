# NLP: Sentiment & Emotion Analysis Pipelines

## Overview
This repository explores **Natural Language Processing (NLP)** techniques to classify unstructured text data. It contrasts two fundamental approaches: a probabilistic **Generative Model (Naive Bayes)** for binary sentiment analysis and a geometric **Discriminative Model (SVM)** for multi-class emotion detection. The focus lies heavily on the text preprocessing pipeline to transform raw, noisy social media data into meaningful numerical vectors.

**Key Result:** Demonstrated that preserving semantic meaning through **emoji-to-text conversion** and using **TF-IDF penalization** significantly improves model discrimination in short-text environments (Tweets) compared to simple frequency counts.

## Methodology
The workflow prioritizes the transformation of unstructured text into a structured vector space:

1.  **Text Preprocessing Pipeline:**
    * **Noise Removal:** Regex-based cleaning of user handles (`@user`), URLs, and hashtags to reduce dimensionality.
    * **Semantic Preservation:** Conversion of emojis to text (e.g., `😂` $\rightarrow$ `face_with_tears_of_joy`) using the `emoji` library to capture sentiment often lost in standard cleaning.
    * **Normalization:** Applied **Unicode Normalization (NFKD)** and ASCII encoding to standardize character sets.
2.  **Vectorization Strategies:**
    * **Bag of Words (CountVectorizer):** Used for the Naive Bayes baseline to capture term frequency.
    * **TF-IDF:** Applied for the SVM model to downweight high-frequency stop words and highlight unique, emotion-bearing terms.
3.  **Model Architectures:**
    * **Multinomial Naive Bayes:** Implemented for Movie Reviews (Binary) due to its efficiency with high-dimensional discrete data.
    * **Linear SVC (SVM):** Implemented for WASSA Tweets (Multiclass) to maximize the decision margin between complex emotional states (Joy, Sadness, Fear, Anger).

## Project Structure
* **Movie Reviews:** Sentiment analysis (Positive/Negative) on long-form text.
* **WASSA-2017:** Fine-grained emotion classification on short-text (Tweets).