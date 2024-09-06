# Get base image
FROM bioconductor/bioconductor_docker:RELEASE_3_19

# environment
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH $PATH:/opt/conda/bin
ENV RENV_VERSION=1.0.7

# get conda installed
RUN wget --quiet "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh" && \
    bash Miniforge3-$(uname)-$(uname -m).sh -b -p /opt/conda && \
    rm Miniforge3-$(uname)-$(uname -m).sh && \
    /opt/conda/bin/conda clean --all -f -y && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    apt-get update

COPY environment.yaml .
RUN /opt/conda/bin/conda config --add channels defaults && \
    /opt/conda/bin/conda config --add channels bioconda && \
    /opt/conda/bin/conda config --add channels conda-forge && \
    /opt/conda/bin/conda config --add channels agbiome && \
    /opt/conda/bin/conda install -n base python=3.10 && \
    conda env update -n base -f environment.yaml && \
    conda clean -afy
    
# Install R packages with renv
RUN R -e "install.packages('renv', version = '${RENV_VERSION}')"


WORKDIR /home/rstudio
COPY renv.lock renv.lock
COPY R_dependencies.R R_dependencies.R
RUN R -e "renv::restore()"