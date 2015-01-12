;; ================================== Init =====================================

(setq custom-file "~/.emacs.d/configs/custom.el")
(load "~/.emacs.d/configs/server.el")
(load "~/.emacs.d/configs/interface.el")
(load "~/.emacs.d/configs/kbd.el")
(load "~/.emacs.d/configs/features.el")
(load "~/.emacs.d/configs/org.el")
;; (load "~/.emacs.d/configs/packages.el")
(load "~/.emacs.d/configs/commands.el")
(load "~/.emacs.d/configs/snippets.el")
(load "~/.emacs.d/configs/templates.el")

(add-hook 'js-mode-hook
          (lambda ()
            (load "~/.emacs.d/configs/js.el")))
(add-hook 'clojure-mode-hook
          (lambda ()
            (load "~/.emacs.d/configs/clojure.el")))
(add-hook 'ruby-mode-hook
          (lambda ()
            (load "~/.emacs.d/configs/ruby/ruby.el")
            (load "~/.emacs.d/configs/ruby/rinari.el")))

;; ========================= To be continued... ================================
