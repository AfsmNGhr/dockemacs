FROM ruby:2.4.0-alpine
MAINTAINER Ermolaev Alexsey <afay.zangetsu@gmail.com>

ENV UNAME=emacser \
    GNAME=emacs \
    HOME=/home/emacser \
    UID=1000 \
    GID=1000 \
    WORKSPACE=/mnt/workspace \
    SHELL=/bin/bash \
    TERM=xterm-256color \
    REPOSITORY=https://github.com/AfsmNGhr/emacs.git

COPY sbin/* /usr/local/sbin/

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/main/ \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ \
        --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
        bash sudo emacs-nox global git nodejs-npm && \
    git clone "$REPOSITORY" "$HOME/.emacs.d" && \
    chown root /usr/local/sbin/initialize && \
    chmod 700 /usr/local/sbin/initialize && \
    rm -rf /usr/share/man /tmp/* /var/cache/apk/* /var/log/* ~/.cache

WORKDIR "${WORKSPACE}"
ENTRYPOINT ["initialize"]
CMD cd "$HOME/.emacs.d" && \
    git pull origin master && \
    (bundle check || bundle install --path "$HOME/.emacs.d/bundle") && \
    npm install && export PATH="$(npm bin):$PATH" && \
    cd "$WORKSPACE" && emacs
