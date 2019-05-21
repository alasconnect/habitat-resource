FROM ubuntu:bionic

ARG CHANNEL=stable
ARG VERSION=0.79.1
ARG HAB_NONINTERACTIVE=true

RUN apt-get update && apt-get install -y curl wget jq

RUN wget https://raw.githubusercontent.com/habitat-sh/habitat/master/components/hab/install.sh -O /tmp/install.sh && \
    bash /tmp/install.sh -v ${VERSION} -c ${CHANNEL} && \
    rm /tmp/install.sh

COPY check /opt/resource/check
COPY in    /opt/resource/in
COPY out   /opt/resource/out

RUN chmod +x /opt/resource/out /opt/resource/in /opt/resource/check

RUN hab -V
