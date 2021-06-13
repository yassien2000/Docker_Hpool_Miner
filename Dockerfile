FROM ubuntu:20.04

ARG BUILD_DATE
ARG HPOOL_VERSION
ARG DOCKER_VERSION
LABEL build_version="Hpool Miner Version:- ${HPOOL_VERSION} Docker Version:- ${DOCKER_VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="CDPro"

WORKDIR /hpool

RUN mkdir -p /hpool /plots

RUN apt update \
        && apt update \
        && apt install zip unzip curl wget git -y

RUN wget -O /hpool/miner.zip https://github.com/hpool-dev/chia-miner/releases/download/v1.4.1-1/HPool-Miner-chia-v1.4.1-0-arm.zip \
	
    && unzip miner.zip \
	
    && mv linux-arm/* /hpool \
	
	&& mv hpool-chia-miner-linux-arm miner \
    

CMD ["/hpool/miner"]
