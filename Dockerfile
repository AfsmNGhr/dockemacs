FROM alpine:3.8

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
        su-exec emacs-nox the_silver_searcher git openssh-client libressl \
        gnupg && \
    rm -rf /usr/share/man /tmp/* /var/cache/apk/* /var/log/* ~/.cache

COPY sbin/* /usr/local/sbin/

RUN chown root /usr/local/sbin/initialize && \
    chmod +x /usr/local/sbin/* && \
    chmod 700 /usr/local/sbin/initialize
