#!/bin/bash 

#SBATCH --job-name=sif
#SBATCH --ntasks=1
#SBATCH --time=04:00:00
#SBATCH --mem=3gb
#SBATCH --output=logs/sif.out
#SBATCH --partition=amilan

singularity_image=scrnaseq_r_v2.sif
docker_image=scrnaseq_v2.tar


singularity build \
   --force \
   $singularity_image \
   docker-archive:$docker_image