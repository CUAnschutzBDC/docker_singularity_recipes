# General docker for long read analysis
This image contains `dorado v0.9.6`, `minimap2`, and `ont-modkit` used for analysis of nanopore data. All packages and versions can be found within the `pixi.toml` and `pixi.lock` files.

## Downloading the image
To download, the image, you can simply run

```bash
docker pull kwellswrasman/dorado:v3
```


## Set up docker image

You can directly build this package on docker with the provided lock file by building from this directory.

```bash
docker build -t dorado:v3 ./
```

## Generate lock file (optional and unnecessary if the lock file exists)
If the lock file isn't present and you would like to generate it, first run the build but stop before the `pixi install` step (comment out all lines).

```bash
docker build -t dorado:v3 ./
```

Then run within the image

```bash
docker run -it --mount type=bind,source="$(pwd)",target=/app/dorado dorado:v3 sh
```

Within the image, run

```bash
pixi install
```

This will install the packages and generate a lock file. Copy the lock file to your main directory

```bash
cp pixi.lock dorado
```

Now exit out of the image, uncomment the full docker file, and rebuild

```bash
exit
docker build -t dorado:v3 ./
```

## Set up on Singularity/Apptainer
To build the singularity image, copy the `Singularity` file to your server. Update this with the appropriate version of the docker image. Update the `create_sif.sh` script to your specifications and submit the job. An image will generated that has already run the `shell_hook.sh` script and should work out of the box.

If you don't want to submit the job, you can run in your terminal
```bash
apptainer build dorado_v3.sif Singularity
```