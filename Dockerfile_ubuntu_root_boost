FROM ubuntu:trusty
MAINTAINER bung@slac.stanford.edu

RUN apt-get update && \
    apt-get --assume-yes install wget \
    dpkg-dev \
    cmake \
    g++ \
    gcc \
    binutils \
    libx11-dev \
    libxpm-dev \
    libxft-dev \
    libxext-dev \
    build-essential \
    make \
    python \
    python-dev \
    libcxxtools-dev \
    libfftw3-dev \
    libmysqlclient-dev \ 
    libpng12-dev \
    libjpeg-turbo8-dev \
    libboost-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /SOFTWARE/root_source
RUN wget -q https://root.cern.ch/download/root_v5.34.36.source.tar.gz \
    && tar --strip-components=1 -xf root_v5.34.36.source.tar.gz -C . \
    && rm root_v5.34.36.source.tar.gz
RUN sh ./configure --disable-xml --disable-fftw3 --enable-builtin-pcre --enable-builtin-freetype \
        --disable-roofit --disable-krb5 --disable-ssl --enable-python --enable-soversion --prefix=/SOFTWARE/root \
        && make -j4
ENV ROOTSYS="/SOFTWARE/root"
ENV PATH="$ROOTSYS/bin:$PATH" 
ENV LD_LIBRARY_PATH="$ROOTSYS/lib/root"
ENV PYTHONPATH="$ROOTSYS/lib/root"
ENV DISPLAY="localhost:0.0"
RUN make install \
    && rm -rf /SOFTWARE/root_source
WORKDIR /SOFTWARE/
