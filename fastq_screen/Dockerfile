# Get base image
FROM condaforge/mambaforge:24.1.2-0

# environment
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH $PATH:/opt/conda/bin

RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*

COPY environment.yaml .
RUN /opt/conda/bin/conda config --add channels defaults && \
    /opt/conda/bin/conda config --add channels bioconda && \
    /opt/conda/bin/conda config --add channels conda-forge && \
    /opt/conda/bin/mamba install -n base python=3.10 && \
    /opt/conda/bin/mamba env update -n base -f environment.yaml && \
    /opt/conda/bin/mamba clean -afy