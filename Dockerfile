FROM ruby:2.3.0-alpine
MAINTAINER Ermolaev Alexsey <afay.zangetsu@gmail.com>

WORKDIR /root
ENV TERM=xterm-256color \
    TZ=Europe/Moscow
RUN apk add --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
        emacs global git nodejs tzdata && cp /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone && apk del tzdata \
    && rm -rf /usr/share/emacs/25*/lisp/emacs-lisp/seq*
CMD cd .emacs.d && (bundle check || (gem install bundle --no-document \
    && bundle install && npm install -g)) && emacs -nw
