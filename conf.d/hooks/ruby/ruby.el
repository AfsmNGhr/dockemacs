;; =============================== Ruby  =======================================

(defvar *ruby-path* "~/.emacs.d/plugins/ruby/")
(add-to-list 'load-path (concat *ruby-path* "inf-ruby"))
(require 'ruby-mode)
(require 'inf-ruby)

;; ================================== Rvm ======================================

(add-to-list 'load-path (concat *ruby-path* "rvm.el"))
(require 'rvm)
(rvm-use-default)

(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
  (rvm-activate-corresponding-ruby))

;; ================================ Robe =======================================

;; (add-to-list 'load-path (concat *ruby-path* "robe"))
;; (require 'robe)

;; (add-hook 'ruby-mode-hook 'robe-mode)
;; (add-hook 'robe-mode-hook 'ac-robe-setup)
;; (add-hook 'robe-mode-hook
;;             (lambda ()
;;               (add-to-list 'ac-sources 'ac-source-robe)
;;               (set-auto-complete-as-completion-at-point-function)))

;; ================================= Rubocop ===================================

(add-to-list 'load-path (concat *ruby-path* "dash.el"))
(require 'dash)

(add-to-list 'load-path (concat *ruby-path* "rubocop-emacs"))
(require 'rubocop)
(add-hook 'ruby-mode-hook 'rubocop-mode)

;; =================================== Rspec ===================================

(add-to-list 'load-path  (concat *ruby-path* "rspec-mode/"))
(require 'rspec-mode)

(eval-after-load 'rspec-mode
  '(rspec-install-snippets))

;; ========================= To be continued... ================================
