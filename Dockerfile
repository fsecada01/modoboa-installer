FROM ubuntu:latest AS intermediate

ENV PYTHONUNBUFFERED=1
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV DEBIAN_FRONTEND=noninteractive

ARG GIT_BRANCH="master"

ENV WORKDIR="/opt/modoboa"
RUN apt update
RUN apt install git -y
RUN git clone -b ${GIT_BRANCH} https://github.com/modoboa/modoboa-installer
WORKDIR /opt/modoboa
WORKDIR ${WORKDIR}
RUN mkdir -p /tmp/log/celery
RUN find . -name "*.sh" -exec chmod +x {} \;
RUN /bin/bash -c 'source $WORKDIR/docker/linux_build.sh'
RUN /bin/bash -c 'source $WORKDIR/docker/python_build.sh'
CMD /bin/bash -c 'source $WORKDIR/docker/python_start.sh'
