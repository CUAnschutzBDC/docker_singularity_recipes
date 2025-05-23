#!/bin/bash 

#SBATCH --job-name=sif
#SBATCH --ntasks=1
#SBATCH --time=04:00:00
#SBATCH --mem=3gb
#SBATCH --output=logs/sif.out
#SBATCH --partition=amilan

singularity_image=seurat3.sif
docker_image=seurat3.tar


singularity build \
   --force \
   $singularity_image \
   docker-archive:$docker_image
