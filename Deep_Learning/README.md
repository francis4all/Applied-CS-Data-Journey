# Deep Learning & Computer Vision

This module explores advanced neural network architectures, focusing on **Transfer Learning**, **Multi-output models**, and performance optimization using PyTorch and FastAI.

## Project Structure

### 1. [Image Classification (FastAI)](./notebooks/01_image_classification_fastai.ipynb)
A streamlined pipeline for multi-class classification using the FastAI high-level API.
* **Core Skills:** Data Augmentation, LR Finder, and model export (`.pkl`).
* **Dataset:** Animal Classification.

### 2. [Transfer Learning Comparison](./notebooks/02_transfer_learning_comparison.ipynb)
A rigorous experimental comparison between **Manual PyTorch** implementation and **FastAI's One-Cycle Policy**.
* **Core Skills:** Fine-tuning ResNet architectures and training efficiency analysis.
* **Outcome:** Comparative performance table (Accuracy vs. Time).

### 3. [Multi-output ResNet (Classification & Regression)](./notebooks/03_multi_output_resnet.ipynb)
Our most advanced model: a custom hybrid CNN that performs multiple tasks in a single forward pass.
* **Architecture:** Custom heads on a ResNet backbone.
* **Tasks:** Age prediction (**Regression**) + Double category labeling (**Classification**).
* **Core Skills:** Custom Loss Functions and GPU acceleration (CUDA).

## Models & Weights
Pre-trained weights are stored in the `/models` directory:
* `Multi_Reg.pth`: Hybrid classification/regression weights.
* `DoloresResNet_Entregable.pth`: Fine-tuned ResNet for cartoon recognition.
* `animal_classifier.pkl`: Exported FastAI learner.

---
*Note: Datasets are managed externally due to size and academic copyright.*