# Docker and Singularity containers
Container image recipe repository for Docker and Singularity

## About
This repository serves as a resource for building and maintaining Docker and Singularity images for different projects.

## Current recipes

* Single cell RNA-seq - includes a recipe to build containers with all necessary R packages for analysis of single cell RNA-seq data. Includes instructions for using `renv` to easily add packages in the future without modifying the existing packages.
* Cut and run - includes a recipe to build containers with all necessary packages to run the cut and run analysis. There are three docker containers.

## Planned updates

* Single cell RNA-seq - include cellranger in the recipe so that the whole pipeline can be run
* RNA-seq
* Bulk ATAC-seq