# Use a base image. 
FROM ubuntu:20.04

# Set environment variables for non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages
RUN apt-get update && apt-get install -y \
    wget \
    tar \
    && apt-get clean

# Create a new directory
RUN mkdir -p /opt/server_bin
RUN mkdir -p /opt/server_env/lib
RUN mkdir -p /opt/server_env/lib

# Add the new directory to the PATH
ENV PATH="/opt/server_bin:${PATH}"
ENV LD_LIBRARY_PATH="/opt/server_env/lib:${LD_LIBRARY_PATH}"

# Set working directory
WORKDIR /opt

# Copy into image
COPY cellranger-8.0.0.tar.gz /opt/

# Extract the tarball
RUN tar -xzvf cellranger-8.0.0.tar.gz

# Create a symbolic link to the executable
RUN ln -s /opt/cellranger-8.0.0/cellranger /usr/local/bin/cellranger

# Clean up
RUN rm cellranger-8.0.0.tar.gz

# Set the default command
CMD ["bash"]