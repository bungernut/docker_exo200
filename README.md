# docker_exo200

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


