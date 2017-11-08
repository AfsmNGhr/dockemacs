FROM alpine:3.6
MAINTAINER Ermolaev Alexsey <afay.zangetsu@gmail.com>

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/main/ \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
        bash sudo emacs-nox the_silver_searcher git openssh-client openssl \
        gnupg && \
    rm -rf /usr/share/man /tmp/* /var/cache/apk/* /var/log/* /root/.cache

COPY sbin/* /usr/local/sbin/

RUN chown root /usr/local/sbin/initialize && \
    chmod +x /usr/local/sbin/* && \
    chmod 700 /usr/local/sbin/initialize
