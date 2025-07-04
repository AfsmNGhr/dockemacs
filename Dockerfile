FROM alpine:3.21.3 AS base

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
        su-exec emacs-nox the_silver_searcher git openssh-client libressl \
        gnupg mu4e isync msmtp && \
    rm -rf /usr/share/man /tmp/* /var/cache/apk/* /var/log/* ~/.cache

COPY sbin/* /usr/local/sbin/

RUN chown root /usr/local/sbin/initialize && \
    chmod +x /usr/local/sbin/* && \
    chmod 700 /usr/local/sbin/initialize

FROM base

ENV UNAME=emacser \
    GNAME=emacs \
    HOME=/home/emacser \
    UID=1000 \
    GID=1000 \
    WORKSPACE=/mnt/workspace \
    SHELL=/bin/bash \
    TERM=xterm-256color \
    CASK=/opt/cask \
    CASK_BIN=/opt/cask/bin

RUN apk update && \
    apk upgrade && \
    apk add --no-cache bash python3 curl gnutls-utils && \
    git clone --depth 1 https://github.com/cask/cask.git "$CASK" && \
    rm -rf /usr/share/man /tmp/* /var/cache/apk/* /var/log/* ~/.cache

COPY . "$HOME/.emacs.d/"

WORKDIR "${WORKSPACE}"
ENTRYPOINT ["initialize"]
CMD cd "$HOME/.emacs.d" && \
    ln -s "$WORKSPACE/.gitconfig" "$HOME/.gitconfig" && \
    ln -s "$WORKSPACE/.ssh" "$HOME/.ssh" && \
    ln -s "$WORKSPACE/.gnupg" "$HOME/.gnupg" && \
    ln -s "$WORKSPACE/.mu" "$HOME/.mu" && \
    ln -s "$WORKSPACE/.mail" "$HOME/.mail" && \
    ln -s "$WORKSPACE/.mbsyncrc" "$HOME/.mbsyncrc" && \
    ln -s "$WORKSPACE/.msmtprc" "$HOME/.msmtprc" && \
    ln -s "$WORKSPACE/.authinfo.gpg" "$HOME/.authinfo.gpg" && \
    export ORG_PATH="$WORKSPACE/$ORG_FILES" && \
    export PATH="$CASK_BIN:$PATH" && \
    env && tangle && rm *.elc && \
    cask install && cask exec buttercup -L . -L tests
