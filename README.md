# 📡Sionna Simulations with Docker

This repository provides a Docker-based environment for running simulations with the Sionna library. It is optimized to leverage GPU acceleration, ensuring a reproducible and high-performance setup.

🔍Included are starter scripts and configurations for research in Resource Allocation and Beamforming, allowing you to begin your experiments quickly.

[Sionna™](https://github.com/nvlabs/sionna) is an open-source, Python-based library for link-level and system level simulations of communication systems. It is tailored for model-based, end-to-end differentiable implementations.

## Summary

1. [📌 Purpose](#purpose)
2. [🚀Getting Started](#getting-started)
   * [🪟 Windows 11](#windows)
   * [🐧 Linux (ubuntu) (👷‍♂️in progress)](#linux-ubuntu)


## Purpose

Setting up a development environment for Sionna can be complex, requiring the installation and compatibility of various dependencies like Python, TensorFlow, CUDA, and cuDNN. Docker can drastically simplifies this process by encapsulating the entire environment within a Docker image.

This approach allows you to:

* Start Quickly: Clone the repository and run your simulations with just a few commands.

* Ensure Reproducibility: The environment is consistent across any machine with Docker installed.

* Isolate Dependencies: Avoid conflicts with other libraries installed on your host system.

* Leverage the GPU: The configuration is ready to use NVIDIA GPU acceleration out of the box.

## Getting Started

Follow the steps below to build the Docker image and run a simulation.

### Windows

### Prerequisites

Before you begin, ensure you have the following software installed:

1. Windows 11 or Windows 10 (version 21H2 or higher).
2. An NVIDIA GPU (like a GeForce RTX or Quadro).
Docker Engine: [Installation instructions](https://docs.docker.com/engine/install/).
3. WSL2 installed with a Linux distribution (Ubuntu is highly recommended).
NVIDIA GPU Drivers: The latest drivers for your NVIDIA graphics card.
4. Docker Desktop for Windows installed and configured to use the WSL2 backend.

### Install the NVIDIA Driver on Windows

This is the most crucial step. You need to install the latest NVIDIA Game Ready or Studio Driver directly from the [NVIDIA website](https://www.nvidia.com.br/Download/index.aspx). This single driver installation on your main Windows OS includes all the necessary components for WSL2 to see your GPU.

> [!WARNING]
> You do not install any NVIDIA drivers inside your WSL2 Linux distribution. The Windows driver handles everything.

## Install WSL2 with Ubuntu

Nowadays, Microsoft has made this step extremely simple.

1. Open PowerShell or Command Prompt (CMD) as an Administrator. (Right-click on the Start Menu and select "Terminal (Admin)" or "PowerShell (Admin)").
2. Run the following command. It will enable all necessary features, and then download and install the latest version of Ubuntu for WSL.

``` PowerShell
wsl --install -d Ubuntu
```

Your computer may need to restart. After restarting, the Ubuntu installation will continue automatically.

The first time Ubuntu starts, it will ask you to create a username and password. These are for your Linux environment and are not related to your Windows password.
>[!IMPORTANT]
> Key Point: We will use Ubuntu because it is the best-supported distribution by NVIDIA and the entire container ecosystem, which avoids the problems you experienced with Arch.

### Install and Configure Docker Desktop

Download and install Docker Desktop. During or after setup, go to Settings > Resources > WSL Integration and make sure "Enable integration with my default WSL distro" is checked and ubuntu
toggle is enable in the "Enable integration with additional distros". This is usually the default.

### Verify GPU Access in WSL2

Before even using Docker, you can confirm that your Linux environment can see the GPU. Open your WSL2 terminal (e.g., Ubuntu) and run:

``` Bash
nvidia-smi
```

If this command successfully shows your GPU details, driver version, and CUDA version, you're good to go.

### Run the TensorFlow GPU Docker Container

Now you can pull and run the official TensorFlow Docker image. The key is the --gpus all flag, which exposes your GPU to the container.

Run this command in your WSL2 or PowerShell terminal:

``` Bash
docker run --gpus all -it --rm tensorflow/tensorflow:2.14.0-gpu-jupyter
   python -c "import tensorflow as tf; print(tf.config.list_physical_devices('GPU'))"
```

If the setup is correct, the output will list your GPU, something like this:

``` Bash
[PhysicalDevice(name='/physical_device:GPU:0', device_type='GPU')]
```

### Linux (Ubuntu)

## Run docker
