# Docker for single cell
This repository contains everything you need to build a docker image for single cell analysis. It uses renv and docker to maximize reproducability

## Contents

* `Dockerfile` - The recipe to build the image
* `R_dependencies.R` - A file that lists all packages needed for your analysis. These are the packages I use most, but edit for your own needs
* `environment.yaml` - All conda packages required. You can add packages that you may need
* `launch_rstudio.sh` - A shell script that can be run to launch rstudio on the server

## To use
Copy all files in this into your own directory open up a terminal and move into that directory.

### Build your image with all required R packages

1. Edit the `R_dependencies.R` file to contain all R packages that you will need for your analysis (don't worry if you need to add more later, we can easily do that).
2. Edit the Dockerfile and comment out the last two lines:
```
#COPY renv.lock renv.lock
#RUN R -e "renv::restore()"
```
3. Build your image (make sure you are in the directory with the `Dockerfile` and `R_dependencies.R`)
```bash
docker build -t {name_of_image}:{version} ./
```
4. Start an interactive session using your image (again make sure you are in the directory with the `Dockerfile` and `R_dependencies.R`)
```bash
docker run -it --mount type=bind,source="$(pwd)",target=/home/rstudio/docker_files {name_of_image}:{version} sh
```
5. In this interactive session, start R
```bash
R
```
6. Install R packages with `renv`
```R
renv::init()
```
7. Check that packages are installed
```R
renv::status()
```
8. If there are missing packages, install manually with `renv`. Note, to install from bioconductor, run `renv::install("bioc:{package_name}")`, to install from github, give the path to the repo `renv::install("{user}/{package})`.
9. Once all packages are installed (keep checking with `renv::status()`), save to the lock file 
```R
renv::snapshot()
```
10. Exit R
```R
q()
```
11. Copy the lock file to your directory containing everything to make your docker image
```bash
cp renv.lock docker_files
```
12. Exit from the session
```bash
exit
```
13. Open the `Dockerfile` and remove the comments at the end of the file
```
COPY renv.lock renv.lock
RUN R -e "renv::restore()"
```
14. Build your image again, using the same name and version as before
```bash
docker build -t {name_of_image}:{version} ./
```
15. You can now use this image using the run command above, or run it in Rstudio using the instructions found [here](https://www.bioconductor.org/help/docker/)

### Transfer your image to the server for use with singularity
If you want to use this image on a server, you will need to do a few additional steps

1. Save the image
```bash
docker save {name_of_image}:{version} > {save_name}.tar
```
2. Copy the tar file to the server
```bash
rsync -avz --progress {save_name.tar} {user}@amc-bodhi:/path/to/save
```
3. On the server, build a `.sif` file. The `.sif` file is the new file you are creating, the `.tar` is the file you moved to the server.
```bash
module load singulairty
singularity build path/to/.sif docker-archive:/path/to/.tar
```
4. Open the `launch_rstudio.sh` file and update the `SINGULARITY_IMAGE` to point to this new `.sif` file you created and the `USER_R_LIB` to point to a unique directory for your r packages
5. Submit this script `bsub < launch_rstudio.sh`
6. Use `bpeek` to look at the output `bpeek {jobid}` and follow the instructions to connect to a rstudio session. Here you will copy the `ssh` line into your local terminal and change `LOGIN-HOST` to `amc-bodhi`. You can then point your we browser to http://localhost:8787 and login to have an interactive R session. Once you are done with your rstudio session, be sure to exit from the ssh and kill the job on the server.

## Adding new packages
If during your work you realize that you need to add new packages, you can easily update the `renv.lock` file without modifying any of your existing package versions.

1. On your local machine, add the new packages to the `R_dependencies.R`.
2. Run an interactive session in your image
```bash
docker run -it --mount type=bind,source="$(pwd)",target=/home/rstudio/docker_files {name_of_image}:{version} sh
```
3. Start R
```bash
R
```
4. Use `renv::status()` to check what needs to be installed
5. Install new packages with `renv`
6. Use `renv::status()` to make sure that only your new packages will be updated
7. Run `renv::snapshot()`
8. Exit R
```R
q()
```
9. Copy the lock file to your directory containing everything to make your docker image
```bash
cp renv.lock docker_files
```
10. Exit from the session
```bash
exit
```

Follow steps 14 and 15 above to rebuild your image and test your installed packages. If you were running on the server, follow the steps in **Transfer your image to the server for use with singularity** to make a new `.sif` file with the new packages.