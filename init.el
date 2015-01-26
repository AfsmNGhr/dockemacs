;; ================================== Init =====================================

(setq custom-file "~/.emacs.d/configs/custom.el")
(load "~/.emacs.d/configs/server.elc")
(load "~/.emacs.d/configs/interface.el")
(load "~/.emacs.d/configs/kbd.el")
(load "~/.emacs.d/configs/features.el")
(load "~/.emacs.d/configs/packages.el")
(load "~/.emacs.d/configs/commands.el")
(load "~/.emacs.d/configs/snippets.el")
(load "~/.emacs.d/configs/templates.el")

(add-hook 'org-mode-hook
  (lambda ()
    (load-file "~/.emacs.d/configs/org.elc")))

(add-hook 'js-mode-hook
  (lambda ()
    (load-file "~/.emacs.d/configs/js.elc")))

(add-hook 'clojure-mode-hook
  (lambda ()
    (load-file "~/.emacs.d/configs/clojure.elc")))

(add-hook 'ruby-mode-hook
  (lambda ()
    (load-file "~/.emacs.d/configs/ruby/ruby.elc")
    (load-file "~/.emacs.d/configs/ruby/rinari.elc")))

;; ========================= To be continued... ================================
