# Docker with talon and transcriptclean
This image contains `talon` version 5.0 and `transcriptclean` version 2.1

## Downloading the image
To download, the image, you can simply run

```bash
docker pull kwellswrasman/talon:v1
```


## Set up docker image

You can directly build this package on docker with the provided lock file by building from this directory.

```bash
docker build -t talon:v1 ./
```

## Set up on Singularity/Apptainer
To build the singularity image, update the `create_sif.sh` script to your specifications and submit the job. An image will generated.

If you don't want to submit the job, you can run in your terminal
```bash
singularity pull --name talon_v1.sif docker://kwellswrasman/talon:v1
```