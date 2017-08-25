(require 'undecover)

(undercover "*.el" "conf.d/*.el" (:exclude "*-test.el"))
(message "Running tests on Emacs %s" emacs-version)
