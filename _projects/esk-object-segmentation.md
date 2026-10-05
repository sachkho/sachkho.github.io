---
layout: page
title: "ESK: Interaction-Aware Object Segmentation"
description: "Geometry-guided orchestration of SAM 3 for manipulated-object segmentation in EPFL-Smart-Kitchen-30"
img: assets/img/esk-object-segmentation.png
importance: 6
category: work
---

## Project Overview

EPFL-Smart-Kitchen-30 (ESK) records cooking activities through nine calibrated static cameras, an egocentric HoloLens view, and 3D body and hand tracking. It provides dense action annotations but lacks pixel-level masks of the manipulated objects. During my research internship at the Mathis Group at EPFL, I investigated how to recover those masks using the dataset's action and geometric signals alongside a frozen SAM 3 segmenter.

The long-term motivation is to relate eye gaze to manipulated objects for behaviour analysis and stroke rehabilitation research. This project develops the segmentation pipeline needed for that goal; the September 2026 thesis reports its benchmark findings, implemented pipeline, and remaining evaluation work.

{% include figure.liquid path="assets/img/esk-object-segmentation.png" alt="SAM 3 mask overlay on a bell pepper being manipulated on a cutting board" caption="A SAM 3 segmentation example during object manipulation. Image from the thesis, Figure 9." %}

## Methodology

- **Controlled benchmark**: Evaluated SAM 3 on short clips separating objects at rest, manipulation without identity change, and transformations such as cutting or peeling.
- **Activity gating**: Used action annotations to restrict inference to relevant manipulation intervals and retain world-state masks between events.
- **Geometry-guided camera selection**: Projected hand-derived 3D anchors into calibrated cameras, selected candidates by field of view and depth, and used hysteresis to stabilise view changes.
- **Persistent outputs**: Stored all masklets as run-length encodings in JSONL, enabling later analysis without repeating GPU inference.
- **Multi-view redesign**: Implemented a probe-and-track strategy that scores candidate views by distance- and focal-length-normalised mask area, rejects inconsistent observations by geometric consensus, and selects three views for tracking.

## Key Contributions

- Characterised practical SAM 3 failure modes before committing to a costly manually annotated training set.
- Built an orchestration pipeline around a frozen foundation model using action annotations, calibrated camera geometry, and 3D hand priors.
- Investigated prompt specificity and memory-bank resets as sources of segmentation loss during object transformations.
- Developed geometry-based frame selection and CVAT annotation infrastructure for future quantitative evaluation.

## Key Results

- **Manipulation was not the dominant failure source** in the inspected clips: carrying, stirring, pouring, and intermittent hand occlusion were often handled successfully.
- **Viewpoint, illumination, and identity mattered**: glare caused view-dependent detection failures, while absent targets could be replaced by visually similar objects with confident masks.
- **State changes exposed prompt limitations**: after a pepper was diced, the original noun prompt could fail to retrieve the pile. A broader description recovered substantially more of it in a single-frame test.
- **Activity gating reduced the reported session budget** from approximately **40 GPU-hours to 2.67 GPU-hours on a V100** for one view. The thesis estimates roughly **8 GPU-hours** for gated tracking across three views.

The benchmark is a small, manually selected qualitative study from one session, without ground-truth masks for IoU evaluation. The multi-view redesign was implemented and unit-tested but had **not been run end to end** at the thesis milestone. Its reconstruction benefit therefore remains to be evaluated. Hand-derived anchors are also imperfect object-position proxies, especially when cut pieces remain on a board while the hand moves with a tool.

## Technologies

- **Language**: Python
- **Model**: SAM 3, text-prompted video segmentation
- **Geometry**: Camera calibration, 3D hand-pose projection, multi-view consensus
- **Tools and formats**: CVAT, run-length encoded masks, JSONL
- **Dataset**: EPFL-Smart-Kitchen-30

## Project Report

This project is covered in **Chapter 4** of my master's thesis, _Multimodal Representation Learning and Interaction-Aware Object Segmentation for Behaviour Understanding_.

[View or download the full thesis]({{ '/assets/img/project_reports/master_thesis_sacha_khosrowshahi.pdf' | relative_url }})

{% include pdf.liquid path="assets/img/project_reports/master_thesis_sacha_khosrowshahi.pdf" caption="Master's thesis — ESK object segmentation methods and results in Chapter 4" %}
