# docker_exo200

Tips to take to heart:
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


