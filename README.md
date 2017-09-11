## Dockemacs - the minimal emacs noX

[![Coverage Status](https://coveralls.io/repos/github/AfsmNGhr/dockemacs/badge.svg?branch=master)](https://coveralls.io/github/AfsmNGhr/dockemacs?branch=master "Coverage Status")
[![Build Status](https://travis-ci.org/AfsmNGhr/dockemacs.svg)](https://travis-ci.org/AfsmNGhr/dockemacs "Build status from Travis CI")
[![Latest Version](https://images.microbadger.com/badges/version/afsmnghr/dockemacs.svg)](https://microbadger.com/images/afsmnghr/dockemacs "Latest version")
[![Image size / layers](https://images.microbadger.com/badges/image/afsmnghr/dockemacs.svg)](https://microbadger.com/images/afsmnghr/dockemacs "Image size / layers")
[![Docker Pulls](https://img.shields.io/docker/pulls/afsmnghr/dockemacs.svg?style=flat-square)](https://hub.docker.com/r/afsmnghr/dockemacs/ "Docker pulls")
[![Docker Stars](https://img.shields.io/docker/stars/afsmnghr/dockemacs.svg?style=flat-square)](https://hub.docker.com/r/afsmnghr/dockemacs/ "Docker stars")

![Dockemacs](http://i.imgur.com/LZxhWdm.png "Image is clickable")

## Installation

* [Install Docker Engine](https://docs.docker.com/engine/installation/):
* Create emacs data volume:

  ```sh
  docker volume create emacs_data
  ```

* Add alias or script file:

  ```sh
  alias dockemacs='
  docker run -it --rm --net=host \
       --env-file $HOME/.dockemacs \
       --entrypoint initialize "$@" \
       -v $HOME:/mnt/workspace \
       -v emacs_data:/home/emacser/.emacs.d \
       -v /etc/localtime:/etc/localtime:ro \
       afsmnghr/dockemacs:1.5.0 startup
  '
  ```

* Prepare `$HOME/.dockemacs`, check your `ENV_VARS`:

  ```sh
  echo "UID=$(id -u)" >> $HOME/.dockemacs
  echo "GID=$(id -g)" >> $HOME/.dockemacs
  echo "UNAME=emacser" >> $HOME/.dockemacs
  echo "GNAME=emacs" >> $HOME/.dockemacs
  echo "HOME=/home/emacser" >> $HOME/.dockemacs
  echo "WORKSPACE=/mnt/workspace" >> $HOME/.dockemacs
  echo "SHELL=/bin/bash" >> $HOME/.dockemacs
  echo "TERM=xterm-256color" >> $HOME/.dockemacs
  echo "ORG_FILES=Documents/org/" >> $HOME/.dockemacs
  echo "DOCKER_TLS_VERIFY=1" >> $HOME/.dockemacs
  echo "DOCKER_HOST=tcp://127.1:2376" >> $HOME/.dockemacs
  echo "DOCKER_CERT_PATH=/home/emacser/.docker/machine/machines/Xrate" >> $HOME/.dockemacs
  echo "DOCKER_MACHINE_NAME=Xrate" >> $HOME/.dockemacs
  echo "HOST_USER=afsmnghr" >> $HOME/.dockemacs
  echo "HOST_IP=127.1" >> $HOME/.dockemacs # only work with --net=host
  echo "HOST_PORT=22" >> $HOME/.dockemacs
  echo "DISPLAY=:0.0" >> $HOME/.dockemacs
  echo "WEB_BROWSER=chromium" >> $HOME/.dockemacs
  ```

    * `UID` and `GID` - transparent permissions
    * `UNAME` and `GNAME` - user & group name in container
    * `HOME` - rewrite home path for new user
    * `WORKSPACE` - mount path from host
    * `SHELL` - default shell
    * `TERM` - set terminal env
    * `ORG_FILES` - only relative path
    * `DOCKER_TLS_VERIFY` - secure by default
    * `DOCKER_HOST`, `DOCKER_CERT_PATH` and `DOCKER_MACHINE_NAME` - docker management
    * `HOST_USER`, `HOST_IP`, `HOST_PORT` - remote management through ssh
    * `DISPLAY` - for GUI application
    * `WEB_BROWSER` - setup browser for emacs

* Setup docker and docker-machine

   * [Protect the Docker daemon socket](https://docs.docker.com/engine/security/https/)
   * [Manual create docker host](https://docs.docker.com/machine/drivers/generic/)

* Setup ssh daemon and restart

  ```sh
  # /etc/ssh/sshd_config
  ListenAddress 127.1
  ```

* Run and wait until the boot:

  ```sh
  $ dockemacs
  ````
