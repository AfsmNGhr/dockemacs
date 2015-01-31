;; =============================== Ruby  =======================================

(add-to-list 'load-path "~/.emacs.d/plugins/ruby")

(require 'ruby-mode)
(require 'inf-ruby)

;; ================================== Rvm ======================================

(require 'rvm)
(rvm-use-default)

;; ================================= Rubocop ===================================

(add-to-list 'load-path "~/.emacs.d/plugins/ruby/dash.el")
(require 'dash)

(add-to-list 'load-path "~/.emacs.d/plugins/ruby/rubocop-emacs")
(require 'rubocop)
(add-hook 'ruby-mode-hook 'rubocop-mode)

;; ========================= To be continued... ================================
