## A minimal emacs noX

[![Build Status](https://travis-ci.org/AfsmNGhr/emacs.svg)](https://travis-ci.org/AfsmNGhr/emacs)
[![](https://images.microbadger.com/badges/version/afsmnghr/alpine-emacs.svg)](https://microbadger.com/images/afsmnghr/alpine-emacs "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/afsmnghr/alpine-emacs.svg)](https://microbadger.com/images/afsmnghr/alpine-emacs "Get your own image badge on microbadger.com")
[![Docker Pulls](https://img.shields.io/docker/pulls/afsmnghr/alpine-emacs.svg?style=flat-square)](https://hub.docker.com/r/afsmnghr/alpine-emacs/)
[![Docker Stars](https://img.shields.io/docker/stars/afsmnghr/alpine-emacs.svg?style=flat-square)](https://hub.docker.com/r/afsmgnhr/alpine-emacs/)

![Emacs](https://raw.githubusercontent.com/myuhe/org-gcal.el/master/emacs.png)

## Customize & [Themes](themes.md)

## Benchmark

```.clojure
Benchmark results

╼►[benchmark-init/root nil 456ms]
  ├─[/usr/share/emacs/25.1/lisp/term/xterm.elc load 2ms]
  ├─[default load 3ms]
  ├─[~/.emacs.d/conf.d/term load 1ms]
  ├─[~/.emacs.d/conf.d/templates load 2ms]
  ├─[~/.emacs.d/conf.d/ruby load 4ms]
  ├─[~/.emacs.d/conf.d/remote load 1ms]
  ├─[~/.emacs.d/conf.d/org load 1ms]
  ├─[~/.emacs.d/conf.d/lisp load 1ms]
  ├─[~/.emacs.d/conf.d/kbd load 1ms]
  ├─[~/.emacs.d/conf.d/js load 1ms]
  ├─[~/.emacs.d/conf.d/interface load 24ms]
  │ ├─[~/.emacs.d/history load 0ms]
  │ ╰─[filenotify require 2ms]
  ├─[~/.emacs.d/conf.d/hooks load 1ms]
  ├─[~/.emacs.d/conf.d/features load 94ms]
  │ ├─[grep require 5ms]
  │ ├─[ibuf-ext require 5ms]
  │ ├─[ibuffer require 22ms]
  │ ├─[thingatpt require 3ms]
  │ ├─[bookmark require 6ms]
  │ │ ╰─[pp require 3ms]
  │ ├─[json require 3ms]
  │ │ ╰─[map require 3ms]
  │ ├─[find-func require 3ms]
  │ ├─[rx require 3ms]
  │ ├─[subr-x require 3ms]
  │ ├─[dash require 5ms]
  │ ├─[~/.emacs.d/company-statistics-cache.el load 1ms]
  │ ├─[company-dabbrev require 1ms]
  │ ├─[company-capf require 1ms]
  │ ├─[company-cmake require 1ms]
  │ ├─[company-clang require 1ms]
  │ ├─[company-eclim require 1ms]
  │ │ ╰─[company-template require 1ms]
  │ ├─[etags require 5ms]
  │ │ ╰─[xref require 10ms]
  │ │   ├─[project require 5ms]
  │ │   ╰─[eieio require 13ms]
  │ │     ╰─[eieio-core require 6ms]
  │ │       ╰─[cl-macs require 6ms]
  │ ├─[compile require 6ms]
  │ │ ╰─[comint require 6ms]
  │ │   ├─[regexp-opt require 3ms]
  │ │   ├─[ansi-color require 3ms]
  │ │   ╰─[ring require 3ms]
  │ ├─[ewoc require 3ms]
  │ ├─[ido-ubiquitous require 53ms]
  │ │ ├─[ido-completing-read+ require 5ms]
  │ │ ╰─[cus-edit require 11ms]
  │ ├─[flx-ido require 16ms]
  │ │ ╰─[flx require 1ms]
  │ ├─[ido-hacks require 2ms]
  │ │ ╰─[ido require 16ms]
  │ ╰─[kmacro require 3ms]
  ├─[~/.emacs.d/conf.d/defuns load 1ms]
  ├─[~/.emacs.d/conf.d/custom load 3ms]
  │ ├─[~/.emacs.d/recentf load 1ms]
  │ ├─[recentf load 17ms]
  │ │ ╰─[tree-widget require 4ms]
  │ │   ╰─[wid-edit require 11ms]
  │ ├─[whitespace load 6ms]
  │ ├─[cus-start require 10ms]
  │ ╰─[cus-load require 21ms]
  ╰─[~/.emacs.d/conf.d/aliases load 2ms]
```

### *To be continued...*
