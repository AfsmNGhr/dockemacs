(require 'undercover)

(undercover "init.el" "conf.d/*.el")
(message "Running tests on Emacs %s" emacs-version)
