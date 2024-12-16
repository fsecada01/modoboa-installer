#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
export TZ='America/New York'


apt-get update && apt-get upgrade -y
apt install wget \
  build-essential \
  curl \
  software-properties-common \
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
add-apt-repository ppa:deadsnakes/ppa
apt install openssh-client \
  python3.13-dev \
  python3.13-full \
  python3.13-venv \
  git \
  postgresql \
  supervisor \
  g++ \
  gcc \
  locales -y
