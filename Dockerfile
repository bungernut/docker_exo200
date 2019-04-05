FROM ubuntu:trusty
MAINTAINER bung@slac.stanford.edu

RUN apt-get --assume-yes update && apt-get --assume-yes install wget dpkg-dev cmake g++ gcc binutils libx11-dev libxpm-dev libxft-dev libxext-dev build-essential make python python-dev libcxxtools-dev git git-svn libfftw3-dev libmysqlclient-dev

WORKDIR /tmp_root/
RUN wget https://root.cern.ch/download/root_v5.34.36.source.tar.gz && tar xf root_v5.34.36.source.tar.gz
WORKDIR /tmp_root/root
RUN ls
RUN pwd
RUN sh ./configure --disable-xml --disable-fftw3 --enable-builtin-pcre --enable-builtin-freetype --disable-roofit --disable-krb5 --disable-ssl --enable-python --enable-soversion
RUN make -j2

