FROM ubuntu:bionic

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    # https://github.com/phusion/baseimage-docker/issues/319
    apt-get --yes install apt-utils 2>&1 | grep -v "debconf: delaying package configuration, since apt-utils is not installed" && \
    apt-get --no-install-recommends --yes install \
        firefox=75\* \
        dumb-init \
        socat \
        fontconfig \
        language-pack-ja \
        fonts-noto \
        fonts-noto-cjk \
        fonts-noto-color-emoji \
        gosu

COPY entrypoint.sh /
COPY profile/ /profile/

EXPOSE 2828

ENTRYPOINT ["dumb-init", "--", "/bin/sh", "entrypoint.sh"]
