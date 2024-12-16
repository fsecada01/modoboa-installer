#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
export TZ='America/New York'


apt-get update && apt-get upgrade -y
apt install wget \
  build-essential \
  software-properties-common \
  git \
  libncursesw5-dev \
  libssl-dev \
  libsqlite3-dev \
  tk-dev \
  libgdbm-dev \
  libc6-dev \
  libbz2-dev \
  libffi-dev \
  sox \
  libcairo2 \
  libcairo2-dev \
  zlib1g-dev -y
