FROM ruby:2.4.0-alpine
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
        openssh gnupg nodejs-npm && \
    rm -rf /usr/share/man /tmp/* /var/cache/apk/* /var/log/* /root/.cache

COPY sbin/* /usr/local/sbin/

RUN git clone "$REPOSITORY" "$HOME/.emacs.d" && \
    chown root /usr/local/sbin/initialize && \
    chmod +x /usr/local/sbin/chrome-remote && \
    chmod 700 /usr/local/sbin/initialize

WORKDIR "${WORKSPACE}"
ENTRYPOINT ["initialize"]
CMD cd "$HOME/.emacs.d" && \
    ln -s "$HOME/.emacs.d/.eslintrc.yaml" "$HOME/.eslintrc.yaml" && \
    ln -s "$WORKSPACE/.docker" "$HOME/.docker" && \
    ln -s "$WORKSPACE/.git" "$HOME/.git" && \
    ln -s "$WORKSPACE/.gitconfig" "$HOME/.gitconfig" && \
    ln -s "$WORKSPACE/.ssh" "$HOME/.ssh" && \
    ln -s "$WORKSPACE/.gnupg" "$HOME/.gnupg" && \
    git stash && \
    (git pull origin master || true) && \
    (bundle check || bundle install --path "$HOME/.emacs.d/bundle" || true) && \
    (npm install || true) && export PATH="$(npm bin):$PATH" && \
    export ORG_PATH="$WORKSPACE/$ORG_FILES" && \
    cd "$WORKSPACE" && emacs
