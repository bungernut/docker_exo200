# Introduction
### Dockerfile_ubuntu_root 
builds `exo200_ubuntu_root` with basic root v5 and essential build tools in ubuntu:trusty image ~700MB \
https://cloud.docker.com/repository/docker/bmong/exo200_ubuntu_root \

### Dockerfile_ubuntu_geant4 
builds `exo200_ubuntu_geant4` installing CLHEP and geant4 on top of exo200_ubuntu_root - require manual install steps (see below) \
https://cloud.docker.com/repository/docker/bmong/exo200_ubuntu_geant4

### ubuntu_build_exo200_offline.txt
Instructions to build offline images. These images are are kept in a private repository. 

## Building the images

### exo200_ubuntu_root
`docker build --squash -f .\Dockerfile_ubuntu_root .` \
This image can be built alone with the docker file, updates to this github should trigger rebuild of this image

### exo200_ubuntu_geant4
* Requires manual steps. Build the image using the Docker_ubuntut_geant4 file\
`docker build -t exo200_ubuntu_geant4_pre -f Docker_ubuntut_geant4 .`
* Run the image and compile per instruction in Docker_ubuntu_geant4
* Commit the changes to the docker-image\
`docker commit <docker_ID> bmong/exo200_ubuntu_geant4:<tag>`
* Push the image to dockerhub\
`docker push bmong/exo200_ubuntu_geant4:latest`

## Resulting Images

### exo200_ubuntu_root_base: 700 MB: Just root and binutils needed to build root

### exo200_ubuntu_offline_nog4: 855 MB  : Offline without Geant4/CLHEP

### exo200_offline: 1.85 GB:  Offline with Geant4 and builtin data 
```
root@6a3cb89039d1:/SOFTWARE# du --max-depth=1 -h .
210M    ./root
181M    ./offline
4.0K    ./offline_source
321M    ./geant4
329M    ./geant4_data
84M     ./clhep
1.1G    . 
```

# Misc Info/Notes

## Installing Docker on linux mint (careful instructions for Ubuntu are wrong for mint)\
The relevent change is this one:\
```
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(. /etc/os-release; echo "$UBUNTU_CODENAME") stable" 
```
FROM: https://computingforgeeks.com/install-docker-and-docker-compose-on-linux-mint-19/

You'll need to add oneself to the docker group as well or you'll get permission denied
sudo usermod -a -G docker $USER
reboot...

## Build Docker image
docker build -t image_title -f docker_file .

## Tips to take to heart when writing a dockerfile:
1) update and install should be same line
```
apt-get update && apt-get install -y \
  package1 \
  package2 \
  && rm -rf /var/lib/apt/lists/*
```
2) Avoid apt-get upgrade, rather use install for packages if updates are needed

3) Checkout Alpine (busybox based) starting image for reduced size. Lowest GCC is 5.3 though...

4) If a service can run without privileges, use USER to change to a non-root user.
   RUN groupadd -r postgres && useradd --no-log-init -r -g postgres postgres
   
5) Use WORKDIR to change working directory

6) 
