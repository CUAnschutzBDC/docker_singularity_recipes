# Docker and Singularity containers
Container image recipe repository for Docker and Singularity

## About
This repository serves as a resource for building and maintaining Docker and Singularity images for different projects.

For more information on using and building individual recipies, see the README for each recipe. Each recipe also explains how to download the image from dockerhub and how to convert the docker image to a singularity/apptainer image if you desire.

Most images are also on [dockerhub](https://hub.docker.com/repositories/kwellswrasman) with individual links below.

## Current recipes

* RNA seq
  * general_docker - Includes a recipe to build the container to run RNA seq analysis, including `STAR`, `featureCounts`, `cutadapt`, `samtools`, and `fastqc`
    * [built image](https://hub.docker.com/repository/docker/kwellswrasman/rnaseq_general/general)
  * R docker - Includes a recipe to build the container to run R scripts associated with RNA seq analysis. Includes packages like `DESeq2`. Check the `R_dependencies.R` file for a full list of installed packages
    * [built image](https://hub.docker.com/repository/docker/kwellswrasman/rna_seq_r/general)
* ATAC seq
  * general docker - Includes a recipe to build the container to run RNA seq analysis, including `bowtie2`, `Macs2`, `hmmratac`, `cutadapt`, `samtools`, and `fastqc`
  * Picard docker - Includes a recipe to build a docker container to run picard tools
  * R docker - Includes a recipe to build the container to run R scripts associated with RNA seq analysis. Includes packages like `DiffBind`. Check the `R_dependencies.R` file for a full list of installed packages
    * [built image](https://hub.docker.com/repository/docker/kwellswrasman/atac_chip_r/general)
* Cut and Run
  * general docker - Includes a recipe to build the container to run RNA seq analysis, including `bowtie2`, `Macs2`, `cutadapt`, `samtools`, and `fastqc`
  * Picard docker - Includes a recipe to build a docker container to run picard tools
  * R docker - Includes a recipe to build the container to run R scripts associated with RNA seq analysis. Includes packages like `DiffBind`. Check the `R_dependencies.R` file for a full list of installed packages
  * Sussel R docker - Includes a recipe to build the container to run R scripts associated with RNA seq analysis. Includes packages like `DiffBind`. Check the `R_dependencies.R` file for a full list of installed packages
* Long read scRNA seq
  * R docker - Includes a recipe to build the container to run R scripts associated with RNA seq analysis. Includes packages like `Seurat` and `scAnalysisR`. Check the `R_dependencies.R` file for a full list of installed packages
  * Dorado - Includes a recipe to build a container for dorado
  * Sockeye - Includes a recipe to build a container for sockeye
* scRNA seq
  * R docker - Includes a recipe to build the container to run R scripts associated with RNA seq analysis. Includes packages like `Seurat` and `scAnalysisR`. Check the `R_dependencies.R` file for a full list of installed packages
  * Smith R docker - Includes a recipe to build the container to run R scripts associated with RNA seq analysis. Includes packages like `Seurat` and `scAnalysisR`. Check the `R_dependencies.R` file for a full list of installed packages. Versions are slightly different than R docker
  * Friedman R docker - Includes a recipe to build the container to run R scripts associated with RNA seq analysis. Includes packages like `Seurat` and `scAnalysisR`. Check the `R_dependencies.R` file for a full list of installed packages. Versions are slightly different than R docker
  * Immcantation - Includes a recipe to build a container with immcantation
  * Dropkick - Includes a recipe to build a continer with dropkick

## R vulenerabilities
We are aware of the R vulenerabilities and I am working on updating all of these images to use R 4.4 or higher. 

Images recipies that have been updated with R 4.4:
* `RNA_seq/r_docker`
* `cut_and_run/r_docker`
* `atac_seq/sussel_r_docker`
* `mixcr/r_docker`

For those using my pre-built images, the following images are R 4.4 or higher:
* `RNA_seq/r_docker/rnaseq_r_v1.tar and RNA_seq/r_docker/rnaseq_r_v1.sif`
* `cut_and_run/r_docker/cut_and_run_v1.tar and cut_and_run/r_docker/cut_and_run_v1.sif`
* `atac_seq/sussel_r_docker/atac_r.tar and atac_seq/sussel_r_docker/atac_r.sif`
* `mixcr/r_docker/mixcr_r_v1.tar and mixcr/r_docker/mixcr_r_v1.tar`
