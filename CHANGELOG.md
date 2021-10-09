## 1.13.0 (2021-10-09)

* Emacs version is `27.2-r0`
* Update base image to `alpine:3.14.2`

## 1.12.1 (2020-03-25)

* Emacs version is `26.3-r2`
* Update base image to `alpine:3.11.5`
* Add `GPG_TTY`with `$(tty)`

## 1.12.0 (2020-02-14)

* Emacs version is `26.3-r2`
* Update base image to `alpine:3.11.3`
* Solved troubles with gnutls

## 1.11.0 (2019-10-20)

* Emacs version is `26.2-r1`
* Update base image to `alpine:3.10.2`
* Use `nproc` instead `CORE_COUNT` variable

## 1.10.0 (2019-01-07)

* Emacs version is `26.1-r0`
* Switched `openssl` to `libressl`
* Optimization wrappers and CI / CD
* Deleted `tslint`, `node`, `bundle`, `docker-machine` wrappers

## 1.9.4 (2018-09-22)

* Updated base image with `alpine:3.8`

## 1.9.3 (2018-01-27)

* Add `CORE_COUNT` for `git fetch`
* Start with `--cpuset-cpus` parameter

## 1.9.2 (2017-12-31)

* Retangle changes `init.org`

## 1.9.1 (2017-12-24)

* Fixed `tslint` with `--type-check`

## 1.9.0 (2017-12-13)

* Switch to `alpine:3.7`
* Remove `bash`, `sudo`
* Rewrite posix like wrappers

## 1.8.1 (2017-12-04)

* Refactor `pylint`, `tslint` wrappers
* Turn off pseudo-tty for `docker`, `docker-machine`, `browser-remote` wrappers

## 1.8.0 (2017-11-23)

* Literate configuration with `init.org`
* Add `BRANCH` and `HEAD_FORCE` variables
* Remove `--repository` edge

## 1.7.0 (2017-11-08)

* Remove `global`

## 1.6.1 (2017-11-07)

* Add `pylint` wrapper

## 1.6.0 (2017-10-23)

* Remove `nodejs-npm`
* Add tty to wrapper docker for `exec`
* Add `tslint` wrapper
* Add `node` wrapper

## 1.5.3 (2017-10-21)

* Remove directives `ENV` and `WORKDIR` from image

## 1.5.2 (2017-09-23)

* Based clean `alpine` image
* Add `rubocop` wrapper

## 1.5.1 (2017-09-13)

* First initialize `REPOSITORY`
* Delete `REPOSITORY` source from image
* Minimize docker build context

## 1.4.0 (2017-08-28)

* One layer image

## 1.3.0 (2017-08-26)

* Add `browser` wrapper

## 1.2.0 (2017-08-26)

* Add simple `docker` management through socket
* Start without `docker-compose`

## 1.1.0 (2017-03-12)

* Delete `node` project packages

## 1.0.0 (2017-03-12)

* Based `alpine-ruby` image
* Pre-installed `nodejs-npm`
