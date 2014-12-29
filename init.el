;; ================================== Init =====================================

(setq custom-file "~/.emacs.d/configs/custom.el")
(load "~/.emacs.d/configs/interface.el")
(load "~/.emacs.d/configs/org.el")
(load "~/.emacs.d/configs/features.el")
(load "~/.emacs.d/configs/packages.el")
(load "~/.emacs.d/configs/commands.el")
(load "~/.emacs.d/configs/kbd.el")
(load "~/.emacs.d/configs/snippets.el")
(with-eval-after-load 'js-mode-hook
  (load "~/.emacs.d/configs/js.el"))
(with-eval-after-load 'clojure-mode-hook
  (load "~/.emacs.d/configs/clojure.el"))
(with-eval-after-load 'ruby-mode-hook
  (load "~/.emacs.d/configs/ruby/ruby.el")
  (load "~/.emacs.d/configs/ruby/rinari.el"))
(load "~/.emacs.d/configs/templates.el")
(load "~/.emacs.d/configs/server.el")

;; ========================= To be continued... ================================
