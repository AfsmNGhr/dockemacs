;; ================================== Hooks ====================================

(defun byte-compile-current-buffer ()
  "`byte-compile' current buffer if it's emacs-lisp-mode
   and compiled file exists."
  (interactive)
  (when (and (eq major-mode 'emacs-lisp-mode)
             (file-exists-p (byte-compile-dest-file buffer-file-name)))
    (byte-compile-file buffer-file-name)))

(defun my-org-hook ()
    "my hook for `org-mode'."
  (interactive)
  (load "~/.emacs.d/configs/hooks/org.el"))

(defun my-js-hook ()
    "my hook for `js-mode'."
  (interactive)
  (load "~/.emacs.d/configs/hooks/js.el"))

(defun my-lisp-hook ()
    "my hook for `lisp-mode'."
  (interactive)
  (load "~/.emacs.d/configs/hooks/lisp/cl.el")
  (load "~/.emacs.d/configs/hooks/lisp/clojure.el"))

(defun my-ruby-hook ()
    "my hook for `ruby-mode'."
  (interactive)
  (load "~/.emacs.d/configs/hooks/ruby/ruby.el")
  (load "~/.emacs.d/configs/hooks/ruby/rinari.el"))

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'after-save-hook 'byte-compile-current-buffer)
(add-hook 'org-mode-hook 'my-org-hook)
(add-hook 'js-mode-hook 'my-js-hook)
(add-hook 'lisp-mode-hook 'my-lisp-hook)
(add-hook 'ruby-mode-hook 'my-ruby-hook)

;; ========================= To be continued... ================================
