---
layout: page
title: "Improving GAN Precision and Recall through GMM and Gradient Ascent"
description: "Balancing precision and recall in GANs."
img: assets/img/GAN.png
importance: 4
category: work
---

## Project Overview

Standard GANs struggle to balance precision and recall; improving visual quality often leads to mode collapse, while increasing diversity can degrade sample sharpness. This project explores two strategies to modify latent space structure and training dynamics on MNIST.

## Methodology

### Gaussian Mixture Models (GM-GAN)
- Multi-modal structure imposed in latent space
- Encourages generator to map regions to semantic modes
- Parameter σ controls precision-diversity trade-off

### Discriminator Gradient Flow (DGFlow)
- Refines samples using discriminator as density ratio estimator
- Step size η controls gradient ascent magnitude
- Diffusion coefficient γ prevents mode collapse
- Refinement steps control iterations

## Experimental Results

- **GMM**: Optimal at σ=0.1 → Precision: 0.89, Recall: 0.79, FID: 19.19
- **DGFlow**: Best triplet (η=5×10^-4, γ=5×10^-2, t=5)
- Confirmed importance of entropy term for diversity

## Technologies

- **Language**: Python
- **Framework**: PyTorch
- **Metrics**: Precision, Recall, FID (Fréchet Inception Distance)
- **Methods**: GMM, Gradient Flow, Entropy regularization

## Project Report

View or download the full project report:

{% include pdf.liquid path="assets/img/project_reports/gan_precision_recall_report.pdf" caption="GAN Precision and Recall Report" %}

## Repository

[View on GitHub](https://github.com/sachkho/Improving-Recall-and-Accuracy-on-GAN)
