;; ================================== Init =====================================

(setq custom-file "~/.emacs.d/configs/custom.el")

(dolist (config-files
         (directory-files "~/.emacs.d/configs" t "\.el$" nil))
  (load (file-name-sans-extension config-files)))

;; (load "~/.emacs.d/configs/server.el")
;; (load "~/.emacs.d/configs/interface.el")
;; (load "~/.emacs.d/configs/kbd.el")
;; (load "~/.emacs.d/configs/features.el")
;; (load "~/.emacs.d/configs/packages.el")
;; (load "~/.emacs.d/configs/commands.el")
;; (load "~/.emacs.d/configs/snippets.el")
;; (load "~/.emacs.d/configs/templates.el")
;; (load "~/.emacs.d/configs/remote.el")

(defun my-org-hook ()
    "my hook for org-mode."
  (interactive)
  (load "~/.emacs.d/configs/hooks/org.el"))

(defun my-js-hook ()
    "my hook for js-mode."
  (interactive)
  (load "~/.emacs.d/configs/hooks/js.el"))

(defun my-lisp-hook ()
    "my hook for lisp-mode."
  (interactive)
  (load "~/.emacs.d/configs/hooks/lisp/cl.el")
  (load "~/.emacs.d/configs/hooks/lisp/clojure.el"))

(defun my-ruby-hook ()
    "my hook for ruby-mode."
  (interactive)
  (load "~/.emacs.d/configs/hooks/ruby/ruby.el")
  (load "~/.emacs.d/configs/hooks/ruby/rinari.el"))

(add-hook 'org-mode-hook 'my-org-hook)
(add-hook 'js-mode-hook 'my-js-hook)
(add-hook 'lisp-mode-hook 'my-lisp-hook)
(add-hook 'ruby-mode-hook 'my-ruby-hook)

;; ========================= To be continued... ================================
