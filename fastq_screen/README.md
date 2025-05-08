# fastq-screen docker

Following installation guide [here](https://stevenwingett.github.io/FastQ-Screen/)

## Set up docker image

You can directly build this package on docker with the provided lock file by building from this directory.

```bash
docker build -t fastq_screen:v1 ./
```

If the lock file isn't present and you would like to generate it, first run the build but stop before the `pixi install` step (comment out all lines).

```bash
docker build -t fastq_screen:v1 ./
```

Then run within the image

```bash
docker run -it --mount type=bind,source="$(pwd)",target=/app/fastq_screen fastq_screen:v1 sh
```

Within the image, run

```bash
pixi install
```

This will install the packages and generate a lock file. Copy the lock file to your main directory

```bash
cp pixi.lock fastq_screen
```

Now exit out of the image

## Set up on Singularity

## Set up once the image is built
Once this is built, within the docker image run

```bash
fastq_screen --get_genomes
```

And save the genomes to a helpful location. Then update the `fastq_screen.conf` and keep with the docker image. Pass this using

```bash
fastq_screen --conf /path/to/fastq_screen.conf sample1.fastq sample2.fastq
```