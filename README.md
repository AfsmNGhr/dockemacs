## Dockemacs - the minimal emacs noX

[![Coverage Status](https://coveralls.io/repos/github/AfsmNGhr/dockemacs/badge.svg?branch=master)](https://coveralls.io/github/AfsmNGhr/dockemacs?branch=master "Coverage Status")
[![Build Status](https://travis-ci.org/AfsmNGhr/dockemacs.svg)](https://travis-ci.org/AfsmNGhr/dockemacs "Build status from Travis CI")
[![](https://images.microbadger.com/badges/version/afsmnghr/dockemacs.svg)](https://microbadger.com/images/afsmnghr/dockemacs "Latest version")
[![](https://images.microbadger.com/badges/image/afsmnghr/dockemacs.svg)](https://microbadger.com/images/afsmnghr/dockemacs "Image size / layers")
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
  docker run -it --rm --net=host \
       --env-file $HOME/.dockemacs \
       -v $HOME:/mnt/workspace \
       -v emacs_data:/home/emacser/.emacs.d \
       -v /var/run/docker.sock:/var/run/docker.sock:ro \
       -v /etc/localtime:/etc/localtime:ro \
       afsmnghr/dockemacs:1.2.0 # or another tag
  ```

* Prepare .dockemacs, check your `ENV_VARS`:

  `UID` and `GID` - transparent permissions
  `ORG_FILES` - only relative path
  `DOCKER_GROUP` or `DOCKER_NAME` - change if custom

  ```sh
  cat << 'EOF' >> $HOME/.dockemacs
  UID=$(id -u)
  GID=$(id -g)
  ORG_FILES=Documents/org/
  DOCKER_NAME=docker
  DOCKER_GROUP=999
  EOF
  ```

* Run and wait until the boot:

  ```sh
  $ dockemacs
  ````
