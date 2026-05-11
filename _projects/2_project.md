---
layout: page
title: "Microtexture Inpainting using Gaussian Models"
description: "Stochastic synthesis of micro-textures using ADSN model"
img: assets/img/inpainting.png
importance: 2
category: work
---

## Project Overview

This project focuses on micro-texture inpainting, where missing parts of images are reconstructed using stochastic modeling techniques. Micro-textures, which lack strong geometric patterns, can be effectively modeled as Gaussian random fields, enabling their synthesis through probabilistic methods.

## Methodology

- **ADSN Model**: Asymptotic Discrete Spot Noise for generating micro-textures
- **Kriging Conditioning**: Ensures continuity at mask boundaries
- **Color Adaptation**: Extension to color images while preserving inter-channel correlations
- **Covariance Matrix**: Derived from auto-covariance function of micro-textures

## Key Results

- Grayscale and color micro-texture synthesis
- Seamless inpainting with smooth boundary transitions
- MSE at contour in order of 10^-21, demonstrating excellent continuity
- Statistically consistent results

## Technologies

- **Language**: Python (Jupyter Notebook)
- **Libraries**: NumPy, SciPy, Matplotlib
- **Methods**: Gaussian random fields, Kriging interpolation, ADSN model

## Project Report

View or download the full project report:

{% include pdf.liquid path="assets/img/project_reports/microtexture_inpainting_report.pdf" caption="Microtexture Inpainting Report" %}

## Repository

[View on GitHub](https://github.com/sachkho/Project-Microtexture-Inpainting)

