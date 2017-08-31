(require 'undercover)

(undercover "*.el")
(message "Running tests on Emacs %s" emacs-version)

(provide 'my/undercover)
