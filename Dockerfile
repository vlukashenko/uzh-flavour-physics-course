FROM rootproject/root:6.30.04-ubuntu22.04

USER root

# System dependencies
RUN apt-get update && apt-get install -y \
    git \
    cmake \
    g++ \
    make \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Python libraries
COPY requirements.txt /tmp/requirements.txt
RUN pip3 install --no-cache-dir -r /tmp/requirements.txt

# Install Jupyter (required by Binder)
RUN pip3 install notebook jupyterlab

# Binder user
RUN useradd -m -s /bin/bash -N -u 1000 jovyan

USER jovyan
WORKDIR /home/jovyan
