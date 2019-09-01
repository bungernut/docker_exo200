# docker_exo200
## Introduction
exo200_ubuntu_root has basic root v5 and essential build tools in ubuntu image ~700MB
exo200_ubuntu_geant4 installs CLHEP and geant4 on top of exo200_ubuntu_root
The image with offline is kept in a private repository, but these can be used to compile offline as needed

## Building the images
### exo200_ubuntu_root
This image can be build alone with the docker file, updates to this github should trigger rebuild of this image
### exo200_ubuntu_geant4
* Requires manual steps. Build the image using the Docker_ubuntut_geant4 file\
`docker build -t exo200_ubuntu_geant4_pre -f Docker_ubuntut_geant4 .`
* Run the image and compile per instruction in Docker_ubuntut_geant4
* Commit the changes to the docker-image\
`docker commit <docker_ID> bmong/exo200_ubuntu_geant4:<tag>`
* Push the image to dockerhub\
`docker push bmong/exo200_ubuntu_geant4:v01`



## Installing Docker on linux mint (careful instructions for Ubuntu are wrong for mint)\
The relevent change is this one:\
```sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(. /etc/os-release; echo "$UBUNTU_CODENAME") stable"```\
FROM: https://computingforgeeks.com/install-docker-and-docker-compose-on-linux-mint-19/

You'll need to add oneself to the docker group as well or you'll get permission denied
sudo usermod -a -G docker $USER
reboot...

## Build Docker image
docker build -t image_title -f docker_file .

## Tips to take to heart when writing a dockerfile:
1) update and install should be same line
apt-get update && apt-get install -y \
  package1 \
  package2 \
  && rm -rf /var/lib/apt/lists/*
  
2) Avoid apt-get upgrade, rather use install for packages if updates are needed

3) Checkout Alpine (busybox based) starting image for reduced size. Lowest GCC is 5.3 though...

4) If a service can run without privileges, use USER to change to a non-root user.
   RUN groupadd -r postgres && useradd --no-log-init -r -g postgres postgres
   
5) Use WORKDIR to change working directory

6) 


