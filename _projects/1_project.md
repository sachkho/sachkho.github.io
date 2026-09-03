---
layout: page
title: "Semantic StyleGAN: Latent Space Manipulation"
description: "Semantic manipulation of images through StyleGAN's latent space"
img: assets/img/stylegan.png
importance: 1
category: work
---

## Project Overview

This project explores semantic manipulation of images in StyleGAN2's latent space, implementing several methods from the literature including InterfaceGAN, GANSpace, and Style Mixing. The goal is to give semantic meaning to the latent space of a pretrained StyleGAN2 model trained on the FFHQ dataset (faces).

## Key Contributions

- Implementation of InterfaceGAN for semantic attribute editing
- GANSpace method for principal direction analysis
- Style mixing for compositional image generation
- Real image projection into latent space (W)
- Integration of multiple state-of-the-art techniques

## Technologies

- **Language**: Python, CUDA, C++
- **Framework**: PyTorch
- **Techniques**: StyleGAN2, InterfaceGAN, GANSpace, SVM, PCA

## Project Report

View or download the full project report:

{% include pdf.liquid path="assets/img/project_reports/semantic_stylegan_report.pdf" caption="Semantic StyleGAN Report" %}

## Repository

[View on GitHub](https://github.com/sachkho/semantic_stylegan)
