# Get base image
FROM ubuntu:rolling

# Install curl
RUN apt-get update && apt-get install -y curl

COPY dorado-0.4.2-linux-x64.tar.gz dorado-0.4.2-linux-x64.tar.gz

RUN tar -xvf dorado-0.4.2-linux-x64.tar.gz

RUN ln -s /dorado-0.4.2-linux-x64/bin/dorado /bin/dorado