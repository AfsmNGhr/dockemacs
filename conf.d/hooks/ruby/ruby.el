;; =============================== Ruby  =======================================

(defvar *ruby-path* "~/.emacs.d/plugins/ruby/")
(add-to-list 'load-path (concat *ruby-path* "inf-ruby"))
(require 'inf-ruby)
(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

;; =============================== Files =======================================

(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))

;; ================================== Rvm ======================================

(require 'rvm)
(rvm-use-default)
(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
  (rvm-activate-corresponding-ruby))

;; ================================ Robe =======================================

(require 'robe)
(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'robe-mode-hook 'ac-robe-setup)

;; ================================= Rubocop ===================================

(require 'dash)
(require 'rubocop)
(add-hook 'ruby-mode-hook 'rubocop-mode)

;; ============================= Smartparens ===================================

(require 'smartparens-config)
(require 'smartparens-ruby)
(add-hook 'rhtml-mode-hook 'smartparens-mode)
(show-smartparens-global-mode t)
(sp-with-modes '(rhtml-mode)
               (sp-local-pair "<" ">")
               (sp-local-pair "<%" "%>"))

;; =================================== Rspec ===================================

(require 'rspec-mode)
(eval-after-load 'rspec-mode
  '(rspec-install-snippets))

;; ========================= To be continued... ================================
