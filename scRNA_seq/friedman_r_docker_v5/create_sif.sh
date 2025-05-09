#!/bin/bash 

#SBATCH --job-name=sif
#SBATCH --ntasks=1
#SBATCH --time=04:00:00
#SBATCH --mem=6gb
#SBATCH --output=logs/sif.out
#SBATCH --partition=amilan

singularity_image=friedman_r_v5.sif
docker_image=friedman_r_v5.tar


singularity build \
   --force \
   $singularity_image \
   docker-archive:$docker_image
