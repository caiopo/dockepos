FROM ubuntu:bionic

MAINTAINER caiopoliveira@gmail.com

WORKDIR /home

RUN apt-get update && \
    apt-get install -y \
        bc \
        bin86 \
        build-essential \
        g++-multilib \
        gcc-multilib \
        gdb \
        gdb-multiarch \
        make \
        python3 \
        python3-pip \
        qemu \
        qemu-kvm \
        qemu-system-arm \
        tar \
        tcsh \
        wget \
        xterm && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/Yelp/dumb-init/releases/download/v1.2.2/dumb-init_1.2.2_amd64.deb && \
    dpkg -i dumb-init_*.deb && \
    rm dumb-init_*.deb

RUN wget -q -O ia32.tar.gz https://epos.lisha.ufsc.br/dl469 && \
    tar -zxvf ia32.tar.gz && \
    mkdir -p /usr/local/ia32/ && \
    mv gcc-7.2.0 /usr/local/ia32/ && \
    rm -r ia32.tar.gz

RUN wget -q -O arm.tar.gz https://epos.lisha.ufsc.br/dl468 && \
    tar -zxvf arm.tar.gz && \
    mkdir -p /usr/local/arm/ && \
    mv gcc-7.2.0 /usr/local/arm/ && \
    rm -r arm.tar.gz

ENV PATH="${PATH}:/usr/local/arm/gcc-7.2.0/bin/"

VOLUME /code
WORKDIR /code

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
