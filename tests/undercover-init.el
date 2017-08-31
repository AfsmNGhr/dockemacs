(when (require 'undercover nil t)
  (undercover "*.el"))

(message "Running tests on Emacs %s" emacs-version)

(let ((debug-on-error t)
      (user-init-file "./init.el")
      (user-emacs-directory default-directory)
      (load-path (delq default-directory load-path)))
  (load-file user-init-file)
  (run-hooks 'after-init-hook))

(provide 'undercover-init.el)
