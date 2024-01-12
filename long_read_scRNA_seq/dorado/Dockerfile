# Get base image
FROM ubuntu:rolling

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
        curl \
        git \
        ca-certificates \
        build-essential \
        nvidia-cuda-toolkit \
        libhdf5-dev \
        libssl-dev \
        libzstd-dev \
        cmake \
        autoconf \
        automake

COPY dorado-0.4.2-linux-x64.tar.gz dorado-0.4.2-linux-x64.tar.gz

RUN tar -xvf dorado-0.4.2-linux-x64.tar.gz

RUN ln -s /dorado-0.4.2-linux-x64/bin/dorado /bin/dorado