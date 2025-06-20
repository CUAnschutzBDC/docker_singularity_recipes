FROM python:3.7-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    build-essential \
    python3-dev \
    zlib1g-dev \
    libbz2-dev \
    liblzma-dev \
    && rm -rf /var/lib/apt/lists/*

# Python deps
RUN pip install --upgrade pip setuptools wheel cython importlib-metadata

# Pin compatible pyranges version
RUN pip install "pyranges<0.0.126"

# Clone and install TALON
RUN git clone https://github.com/mortazavilab/TALON.git /app/TALON && \
    pip install /app/TALON && \
    rm -rf /app/TALON

RUN git clone https://github.com/mortazavilab/TranscriptClean.git /app/TranscriptClean && \
    pip install /app/TranscriptClean && \
    rm -rf /app/TranscriptClean