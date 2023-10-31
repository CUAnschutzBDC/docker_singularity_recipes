# Docker and Singularity containers
Container image recipe repository for Docker and Singularity

## About
This repository serves as a resource for building and maintaining Docker and Singularity images for different projects.

## Current recipes

* RNA seq
  * general_docker - Includes a recipe to build the container to run RNA seq analysis, including `STAR`, `featureCounts`, `cutadapt`, `samtools`, and `fastqc`
  * R docker - Includes a recipe to build the container to run R scripts associated with RNA seq analysis. Includes packages like `DESeq2`. Check the `R_dependencies.R` file for a full list of installed packages
* ATAC seq
  * general docker - Includes a recipe to build the container to run RNA seq analysis, including `bowtie2`, `Macs2`, `hmmratac`, `cutadapt`, `samtools`, and `fastqc`
  * Picard docker - Includes a recipe to build a docker container to run picard tools
  * R docker - Includes a recipe to build the container to run R scripts associated with RNA seq analysis. Includes packages like `DiffBind`. Check the `R_dependencies.R` file for a full list of installed packages
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