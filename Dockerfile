FROM ruby:2.4.1-alpine3.6
MAINTAINER Ermolaev Alexsey <afay.zangetsu@gmail.com>

ENV HOME=/home/emacser \
    WORKSPACE=/mnt/workspace

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/main/ \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
        bash sudo emacs-nox global the_silver_searcher git openssh-client \
        openssl gnupg nodejs-npm && \
    rm -rf /usr/share/man /tmp/* /var/cache/apk/* /var/log/* /root/.cache

COPY sbin/* /usr/local/sbin/

RUN chown root /usr/local/sbin/initialize && \
    chmod +x /usr/local/sbin/* && \
    chmod 700 /usr/local/sbin/initialize

WORKDIR "${WORKSPACE}"
