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
It's easy to include images in a flexible 3-column grid format.
Make your photos 1/3, 2/3, or full width.

To give your project a background in the portfolio page, just add the img tag to the front matter like so:

    ---
    layout: page
    title: project
    description: a project with a background image
    img: /assets/img/12.jpg
    ---

<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/1.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/3.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/5.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    Caption photos easily. On the left, a road goes through a tunnel. Middle, leaves artistically fall in a hipster photoshoot. Right, in another hipster photoshoot, a lumberjack grasps a handful of pine needles.
</div>
<div class="row">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.liquid loading="eager" path="assets/img/5.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    This image can also have a caption. It's like magic.
</div>

You can also put regular text between your rows of images.
Say you wanted to write a little bit about your project before you posted the rest of the images.
You describe how you toiled, sweated, _bled_ for your project, and then... you reveal its glory in the next row of images.

<div class="row justify-content-sm-center">
    <div class="col-sm-8 mt-3 mt-md-0">
        {% include figure.liquid path="assets/img/6.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
    <div class="col-sm-4 mt-3 mt-md-0">
        {% include figure.liquid path="assets/img/11.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    You can also have artistically styled 2/3 + 1/3 images, like these.
</div>

The code is simple.
Just wrap your images with `<div class="col-sm">` and place them inside `<div class="row">` (read more about the <a href="https://getbootstrap.com/docs/4.4/layout/grid/">Bootstrap Grid</a> system).
To make images responsive, add `img-fluid` class to each; for rounded corners and shadows use `rounded` and `z-depth-1` classes.
Here's the code for the last row of images above:

{% raw %}

```html
<div class="row justify-content-sm-center">
  <div class="col-sm-8 mt-3 mt-md-0">
    {% include figure.liquid path="assets/img/6.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
  </div>
  <div class="col-sm-4 mt-3 mt-md-0">
    {% include figure.liquid path="assets/img/11.jpg" title="example image" class="img-fluid rounded z-depth-1" %}
  </div>
</div>
```

{% endraw %}
