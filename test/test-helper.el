(when (require 'undercover nil t)
  (undercover "init.el"))

(message "Running tests on Emacs %s" emacs-version)
