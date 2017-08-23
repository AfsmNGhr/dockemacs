#!/usr/bin/emacs --script

(require 'server)
(unless (server-running-p)
      (server-start))

(let ((debug-on-error t)
      (user-init-file "./init.el")
      (user-emacs-directory default-directory)
      (load-path (delq default-directory load-path)))
  (load-file user-init-file)
  (run-hooks 'after-init-hook))
