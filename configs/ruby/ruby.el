;; =============================== Ruby  =======================================

(add-to-list 'load-path "~/.emacs.d/plugins/ruby/robe")
(add-to-list 'load-path "~/.emacs.d/plugins/ruby")

;; ================================== Rvm ======================================

(require 'rvm)
(rvm-use-default)

;; ================================== Robe =====================================

(require 'ruby-mode)
(require 'inf-ruby)
(require 'robe)
(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'robe-mode-hook 'ac-robe-setup)

(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
  (rvm-activate-corresponding-ruby))

;; ================================= Rubocop ===================================

(add-to-list 'load-path "~/.emacs.d/plugins/ruby/dash.el")
(require 'dash)

(add-to-list 'load-path "~/.emacs.d/plugins/ruby/rubocop-emacs")
(require 'rubocop)
(add-hook 'ruby-mode-hook 'rubocop-mode)

;; ========================= To be continued... ================================
