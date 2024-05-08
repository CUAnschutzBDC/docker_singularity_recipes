# Get base image
FROM bioconductor/bioconductor_docker:RELEASE_3_17

# environment
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH $PATH:/opt/conda/bin
ENV RENV_VERSION 0.16.0

# get conda installed
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    /opt/conda/bin/conda clean --all -f -y && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    apt-get update

COPY environment.yaml .
RUN /opt/conda/bin/conda config --add channels defaults && \
    /opt/conda/bin/conda config --add channels bioconda && \
    /opt/conda/bin/conda config --add channels conda-forge && \
    /opt/conda/bin/conda install -c conda-forge mamba && \
    mamba env update -n base -f environment.yaml && \
    conda clean -afy


# Install R packages with renv
RUN R -e "install.packages('remotes', repos = c(CRAN = 'https://cloud.r-project.org'))"
RUN R -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"


# Set up ngsplot
RUN mkdir /software
COPY ngsplot /software/ngsplot
RUN ln -s /software/ngsplot/bin/* /bin/
ENV NGSPLOT /software/ngsplot

COPY genomes /home/genomes

RUN echo "y" | ngsplotdb.py install /home/genomes/ngsplotdb_hg38_76_3.00.tar.gz
RUN echo "y" | ngsplotdb.py install /home/genomes/ngsplotdb_mm10_75_3.00.tar.gz

WORKDIR /home/rstudio
COPY R_dependencies.R R_dependencies.R
COPY renv.lock renv.lock
RUN R -e "renv::restore()"