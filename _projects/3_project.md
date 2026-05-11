---
layout: page
title: "3D Surface Reconstruction: Noise-to-Noise Mapping"
description: "Reconstructing 3D surfaces from noisy point clouds using neural implicit functions"
img: assets/img/3D.png
importance: 3
category: work
---

## Project Overview

This project implements 3D surface reconstruction from noisy point clouds using the Noise-to-Noise Mapping approach with a novel Positional Encoding layer. The goal is to transform raw point clouds from noisy sensors into clean continuous surfaces represented as Signed Distance Functions (SDFs).

## Technical Innovation: Positional Encoding

The original model suffered from spectral bias (over-smoothing). To address this, I implemented harmonic positional encoding that:
- Transforms coordinates into higher-dimensional space using periodic functions
- Captures high-frequency details and sharp features
- Prevents merger of disconnected structures
- Improves edge precision on complex geometries

## Key Contributions

- Positional encoding implementation for frequency capture
- GCP/GPU deployment and optimization (NVIDIA Tesla T4)
- Sensitivity analysis of iso-surface thresholds
- Earth Mover's Distance (EMD) loss implementation

## Technologies

- **Language**: Python, C++, CUDA
- **Framework**: TensorFlow 1.15
- **Techniques**: MLP networks, Positional encoding, Marching Cubes, EMD loss

## Project Report

View or download the full project report:

{% include pdf.liquid path="assets/img/project_reports/noise2noise_surface_report.pdf" caption="3D Surface Reconstruction Report" %}

## Repository

[View on GitHub](https://github.com/sachkho/Noise2Noise-Surface-Reconstruction)

