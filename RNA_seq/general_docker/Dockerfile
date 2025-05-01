# Get base image
FROM ubuntu:rolling

# Combine apt operations to reduce image layers and cleanup in the same layer
# to minimize size
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    wget \
    curl \
    sudo \
    zip \
    unzip \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Setup a non-root user (best practice for security)
RUN useradd -ms /bin/bash user && \
    echo "user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/user

# Switch to non-root user
USER user
WORKDIR /home/user

# Install Pixi
RUN curl -fsSL https://pixi.sh/install.sh | bash && \
    echo 'export PATH="$HOME/.pixi/bin:$PATH"' >> ~/.bashrc

# Make sure pixi is in the PATH
ENV PATH="/home/user/.pixi/bin:${PATH}"

# Create a pixi.toml file for your project
RUN mkdir -p /home/user/project
WORKDIR /home/user/project
RUN pixi init rnaseq


# Copy the pixi.toml file
COPY --chown=user:user pixi.toml /home/user/project/pixi.toml

# Install all dependencies
RUN pixi install

# Set up the entrypoint to use pixi environments
ENTRYPOINT ["/bin/bash", "-c", "source ~/.bashrc && pixi shell"]