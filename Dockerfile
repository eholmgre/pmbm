FROM ubuntu:lunar-20230420

RUN apt-get update && \
    apt-get -y install cmake \
                       libeigen3-dev \
                       python3 \
                       python3-pip \
                       git && \
    pip3 install filterpy \
                motmetrics \
                deep

WORKDIR /home/ubuntu/devel
COPY . pmbm

WORKDIR /home/ubuntu/devel/pmbm
RUN git submodule update --init

WORKDIR /home/ubuntu/devel/pmbm/murty
RUN make && \
    make test

WORKDIR /home/ubuntu/devel
