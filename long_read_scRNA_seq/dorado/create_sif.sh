#!/bin/bash 

#SBATCH --job-name=sif
#SBATCH --ntasks=1
#SBATCH --time=12:00:00
#SBATCH --mem=20gb
#SBATCH --output=logs/sif.out
#SBATCH --partition=amilan

singularity pull --name dorado_0.9.6.sif docker://kwellswrasman/dorado:v2
