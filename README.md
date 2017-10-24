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
       afsmnghr/dockemacs:1.6.0 startup
  '
  ```

* Prepare `$HOME/.dockemacs`, check your `env`:

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
  echo "HOST_USER=afsmnghr" >> $HOME/.dockemacs
  echo "HOST_IP=127.1" >> $HOME/.dockemacs # only work with --net=host
  echo "HOST_PORT=22" >> $HOME/.dockemacs
  echo "DISPLAY=:0.0" >> $HOME/.dockemacs
  echo "WEB_BROWSER=chromium" >> $HOME/.dockemacs
  echo "REPOSITORY=git@github.com:AfsmNGhr/dockemacs.git" >> $HOME/.dockemacs
  ```

    * `UID` and `GID` - transparent permissions
    * `UNAME` and `GNAME` - user & group name in container
    * `HOME` - rewrite home path for new user
    * `WORKSPACE` - mount path from host
    * `SHELL` - default shell
    * `TERM` - set terminal env
    * `ORG_FILES` - only relative path
    * `HOST_USER`, `HOST_IP`, `HOST_PORT` - remote management through ssh
    * `DISPLAY` - for GUI application
    * `WEB_BROWSER` - setup browser for emacs
    * `REPOSITORY` - our repository dotemacs (first clone)

* Setup ssh daemon and restart

  ```sh
  # /etc/ssh/sshd_config

  ListenAddress 127.1
  ```

* Run and wait until the boot:

  ```sh
  $ dockemacs
  ```

## Wrappers through ssh -> another containers, host

* `WEB_BROWSER`

* [Docker](https://docs.docker.com/)

* [Bundle](http://bundler.io/)

  ```elisp
  ;; .dir-locals.el

  ((nil . ((eval .
               (progn
                 (setenv "PROJECT_LOCAL_PATH" "/mnt/workspace/local/path")
                 (setenv "PROJECT_REMOTE_PATH" "/remote/path")
                 (setenv "PROJECT_BUNDLE_CMD" "docker exec -it `CONTAINER` bundle"))))))
  ```

* [Rubocop](https://github.com/bbatsov/rubocop):

  ```elisp
  ;; .dir-locals.el

  ((nil . ((eval .
               (progn
                 (setenv "PROJECT_LOCAL_PATH" "/mnt/workspace/local/path")
                 (setenv "PROJECT_REMOTE_PATH" "/remote/path")
                 (setenv "PROJECT_RUBOCOP_CMD" "docker exec -it `CONTAINER` bundle exec rubocop"))))))
  ```

* [node](https://nodejs.org/)

  ```elisp
  ;; .dir-locals.el

  ((nil . ((eval .
               (progn
                 (setenv "PROJECT_LOCAL_PATH" "/mnt/workspace/local/path")
                 (setenv "PROJECT_REMOTE_PATH" "/remote/path")
                 (setenv "PROJECT_NODE_CMD" "docker exec -it `CONTAINER` node"))))))
  ```

* [tslint](https://www.npmjs.com/package/tslint)

  ```elisp
  ;; .dir-locals.el

  ((nil . ((eval .
               (progn
                 (setenv "PROJECT_LOCAL_PATH" "/mnt/workspace/local/path")
                 (setenv "PROJECT_REMOTE_PATH" "/remote/path")
                 (setenv "PROJECT_TSLINT_CMD" "docker exec -it `CONTAINER` tslint")
                 (setenv "PROJECT_TSLINT_CMD" "cd /remote/path && /$(npm bin)/tslint"))))))
  ```
