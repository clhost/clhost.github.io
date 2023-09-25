FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

ARG GH_TOKEN

RUN apt-get update \
    && apt-get install -y \
        ca-certificates \
        openssh-client \
        nodejs \
        curl \
        python3-pip \
        git \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install git+https://$GH_TOKEN@github.com/squidfunk/mkdocs-material-insiders.git \
    && pip3 install minify \
    && pip3 install markdown \
    && pip3 install meta \
    && mkdocs --version
