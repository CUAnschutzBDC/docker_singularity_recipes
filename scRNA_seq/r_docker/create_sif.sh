#!/bin/bash 

#SBATCH --job-name=sif
#SBATCH --ntasks=1
#SBATCH --time=12:00:00
#SBATCH --mem=6gb
#SBATCH --output=logs/sif.out
#SBATCH --partition=amilan

singularity pull --name scrna_seq_r_v3.sif docker://kwellswrasman/scrna_seq_r:v3
