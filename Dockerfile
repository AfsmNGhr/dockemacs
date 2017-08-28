FROM ruby:2.4.1-alpine3.6
MAINTAINER Ermolaev Alexsey <afay.zangetsu@gmail.com>

ENV UNAME=emacser \
    GNAME=emacs \
    HOME=/home/emacser \
    UID=1000 \
    GID=1000 \
    DOCKER_NAME=docker \
    DOCKER_GROUP=999 \
    WORKSPACE=/mnt/workspace \
    SHELL=/bin/bash \
    TERM=xterm-256color \
    REPOSITORY=https://github.com/AfsmNGhr/dockemacs.git

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/main/ \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
        bash sudo emacs-nox docker global the_silver_searcher git \
        openssh openssl gnupg nodejs-npm && \
    rm -rf /usr/share/man /tmp/* /var/cache/apk/* /var/log/* /root/.cache

COPY sbin/* /usr/local/sbin/

RUN git clone "$REPOSITORY" "$HOME/.emacs.d" && \
    chown root /usr/local/sbin/initialize && \
    chmod +x /usr/local/sbin/* && \
    chmod 700 /usr/local/sbin/initialize

WORKDIR "${WORKSPACE}"
