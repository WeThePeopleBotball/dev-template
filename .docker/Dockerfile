FROM sillyfreak/wombat-cross

USER root

# Set timezone
ENV TZ=Europe/Vienna
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Basic utilities and AArch64 toolchain
RUN apt update && apt install -y \
    gcc-aarch64-linux-gnu \
    g++-aarch64-linux-gnu \
    cmake \
    wget \
    git \
    xz-utils \
    dpkg-dev \
    build-essential \
    curl \
    make \
    doxygen \
    graphviz

# Alias for BSD-style make if needed
RUN ln -s /usr/bin/make /usr/bin/gmake

# Enable source repositories to build curl
RUN echo "deb-src http://archive.ubuntu.com/ubuntu/ focal main restricted" >> /etc/apt/sources.list && \
    echo "deb-src http://archive.ubuntu.com/ubuntu/ focal-updates main restricted" >> /etc/apt/sources.list && \
    echo "deb-src http://archive.ubuntu.com/ubuntu/ focal universe" >> /etc/apt/sources.list && \
    echo "deb-src http://archive.ubuntu.com/ubuntu/ focal-updates universe" >> /etc/apt/sources.list && \
    apt update

# Build and install libcurl for AArch64
RUN mkdir -p /usr/aarch64-linux-gnu/include && \
    cd /tmp && \
    wget http://archive.ubuntu.com/ubuntu/pool/main/c/curl/curl_7.68.0-1ubuntu2.25.dsc && \
    apt-get source curl && \
    cd curl-7.68.0 && \
    ./configure --host=aarch64-linux-gnu --prefix=/usr/aarch64-linux-gnu && \
    make -j$(nproc) && \
    make install && \
    rm -rf /tmp/curl-7.68.0 curl_7.68.0-1ubuntu2.25.dsc

# Add toolchain config
COPY aarch64-toolchain.cmake /
