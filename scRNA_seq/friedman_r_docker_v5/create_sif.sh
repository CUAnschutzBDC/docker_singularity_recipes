#!/bin/bash 

#SBATCH --job-name=sif
#SBATCH --ntasks=1
#SBATCH --time=12:00:00
#SBATCH --mem=6gb
#SBATCH --output=logs/sif.out
#SBATCH --partition=amilan

singularity pull --name sr_docker_dropt_v1.sif docker://kwellswrasman/r_docker_dropt:v1
