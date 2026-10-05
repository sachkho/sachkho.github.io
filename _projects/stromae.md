---
layout: page
title: "STrOMAE: Multimodal Behaviour Understanding"
description: "A unified VideoMAE fine-tuning framework for multimodal, multi-task behaviour recognition"
img: assets/img/stromae.png
importance: 5
category: work
---

## Project Overview

Developed during my research internship at the Mathis Group at EPFL, STrOMAE (Shared Transformer Orchestrator Masked Autoencoder) unifies separate video, audio, and segmentation-map training pipelines into a single configurable framework. Built on a pretrained VideoMAE backbone, it supports multiple input streams and prediction tasks without maintaining a separate training script for each dataset.

I validated the framework on two complementary settings: wildlife behaviour recognition on MammAlps and human action recognition on EPFL-Smart-Kitchen-30. The results below reflect the September 2026 milestone documented in my master's thesis.

{% include figure.liquid path="assets/img/stromae.png" alt="A static camera view of a cooking activity in EPFL-Smart-Kitchen-30" caption="EPFL-Smart-Kitchen-30 provides synchronised camera views and 3D pose streams for multimodal action recognition. Image from the thesis, Figure 2." %}

## Methodology

- **Token-level fusion**: Dedicated embedders map video, audio spectrograms, segmentation maps, and pose coordinates into a shared token space. The concatenated tokens interact through full self-attention in one Vision Transformer trunk.
- **Multi-task prediction**: Configurable heads share the pooled representation, with per-head loss functions and weights for multiclass and multilabel tasks.
- **Declarative experiments**: Dataset and training configurations specify modalities, annotation paths, prediction heads, and hyperparameters. A common CSV annotation contract and configurable path resolution serve both datasets.
- **Distributed training**: PyTorch DDP, gradient accumulation, and gradient checkpointing support ViT-Large runs on H100 GPUs.

## Key Contributions

- Unified dataset loading, modality fusion, training, and evaluation across two distinct benchmarks.
- Introduced a four-sample overfitting check to diagnose training correctness before full experiments.
- Corrected silent defects in loss dispatch, learning-rate scaling, class-imbalance handling, and multi-head sampling.
- Added distributed per-head mean average precision (mAP) evaluation for multilabel recognition.

## Key Results

On MammAlps benchmark 1, ViT-Large runs trained for 150 epochs achieved the following macro mAP scores:

| Input modalities                  | Species | Activity | Actions | Average |
| :-------------------------------- | ------: | -------: | ------: | ------: |
| Video                             |   0.518 |    0.596 |   0.515 |   0.543 |
| Video + audio                     |   0.570 |    0.611 |   0.522 |   0.568 |
| Video + audio + segmentation maps |   0.545 |    0.520 |   0.430 |   0.499 |

Audio improved the average score over video alone, while adding segmentation maps reduced it under the tested configuration.

On EPFL-Smart-Kitchen-30, using egocentric and exocentric video with 3D body and hand pose, the framework reached **62.25% verb top-1 accuracy** and **53.72% noun top-1 accuracy** on the full 35,032-clip test split. Top-5 accuracies were **93.22%** and **79.79%**, respectively.

These experiments establish that the shared framework can reach the reference benchmark level across both datasets. Differences in checkpoint initialisation, modality combinations, sampling, and supervision mean the published-baseline comparisons are not controlled measurements of methodological improvement. Only the video embedder inherits pretrained weights; the other modality embedders are learned during fine-tuning.

## Technologies

- **Language**: Python
- **Framework**: PyTorch, DistributedDataParallel (DDP)
- **Models**: VideoMAE, ViT-Base, ViT-Large
- **Methods**: Token-level multimodal fusion, multi-task learning, balanced sampling
- **Datasets**: MammAlps, EPFL-Smart-Kitchen-30

## Project Report

This project is covered in **Chapter 3** of my master's thesis, _Multimodal Representation Learning and Interaction-Aware Object Segmentation for Behaviour Understanding_.

[View or download the full thesis]({{ '/assets/img/project_reports/master_thesis_sacha_khosrowshahi.pdf' | relative_url }})

{% include pdf.liquid path="assets/img/project_reports/master_thesis_sacha_khosrowshahi.pdf" caption="Master's thesis — STrOMAE methods and results in Chapter 3" %}
