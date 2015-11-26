#!/usr/bin/emacs --script

;; original source
;; https://github.com/purcell/emacs.d/blob/master/test-startup.sh

(require 'cl)
(require 'server)
(unless (server-running-p)
      (server-start))
(load-library "package")

(let ((debug-on-error t)
      (user-init-file "./init.el")
      (user-emacs-directory default-directory)
      (load-path (delq default-directory load-path)))
  (load-file user-init-file)
  (run-hooks 'after-init-hook))

(ert-deftest theme ()
  "A test that check theme"
  (should (eq custom-enabled-themes nil)))

(ert t)
