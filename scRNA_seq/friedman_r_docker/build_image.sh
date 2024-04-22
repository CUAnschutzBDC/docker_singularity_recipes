#!/bin/bash 

#SBATCH --job-name=singluarlity
#SBATCH --ntasks=1
#SBATCH --time=03:00:00
#SBATCH --mem=4gb
#SBATCH --output=logs/singularity_%J.out
#SBATCH --partition=amilan
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kristen.wells-wrasman@cuanschutz.edu

# Load modules
#module load singularity/3.7.4 

# Make log dir
mkdir -p logs

# Variables for the docker tar and the sif file to be created
docker_tar=friedman_human_v4.tar
singularity_image=friedman_human_v4.sif

# Check if the image already exists
if [ -e "$singularity_image" ]; then
    # File exists, so delete it
    rm "$singularity_image"
    echo "File $singularity_image deleted"
else
    echo "File $singularity_image did not already exist"
fi

# Build singularity image
singularity build $singularity_image docker-archive:$docker_tar
