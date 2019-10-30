FROM centos:centos7

RUN yum -y update && yum -y install \
           file \
           wget \
           git \
           make \
           cmake \
           gcc-c++ \
           gcc \
           binutils \
           libX11 \
           libX11-devel \
           libXpm-devel \
           libXft-devel \
           libXext-devl \
           openssl-devel \
           mesa-libGL-devel \
           mesa-libGLU-devel \
           mysql-devel \
           fftw-devel \
           graphviz-devel \
           python-devel \
           libxml2-devel \
           gsl-static \
           vim \
    && yum clean all \
    && rm -rf /var/cache/yum

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python get-pip.py && rm get-pip.py \
    && pip install --no-cache-dir tensorflow==1.14 \
    && pip install --no-cache-dir keras==2.3.0


WORKDIR /SOFTWARE/root_source
RUN wget -q https://root.cern.ch/download/root_v5.34.36.source.tar.gz \
    && tar --strip-components=1 -xf root_v5.34.36.source.tar.gz -C . \
    && rm root_v5.34.36.source.tar.gz 
RUN sh ./configure --disable-xml --disable-fftw3 --enable-builtin-pcre \
    --enable-builtin-freetype --enable-roofit --disable-krb5 --disable-ssl \
    --enable-python --enable-soversion --prefix=/SOFTWARE/root && \
    make -j4 
ENV ROOTSYS="/SOFTWARE/root"
ENV PATH="$ROOTSYS/bin:$PATH" 
ENV LD_LIBRARY_PATH="$ROOTSYS/lib/root"
ENV PYTHONPATH="$ROOTSYS/lib/root"
ENV DISPLAY="localhost:0.0"
RUN make install \
    && cd /SOFTWARE/ && rm -rf /SOFTWARE/root_source
WORKDIR /SOFTWARE/
