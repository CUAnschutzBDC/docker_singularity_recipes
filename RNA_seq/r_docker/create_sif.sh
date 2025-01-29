#!/bin/bash 

#SBATCH --job-name=sif
#SBATCH --ntasks=1
#SBATCH --time=04:00:00
#SBATCH --mem=6gb
#SBATCH --output=logs/sif.out
#SBATCH --partition=amilan

singularity_image=rnaseq_r_v2.sif
docker_image=rnaseq_r_v2.tar

find ./ -type f -exec chmod 644 {} \;
singularity build \
   --force \
   $singularity_image \
   docker-archive:$docker_image
