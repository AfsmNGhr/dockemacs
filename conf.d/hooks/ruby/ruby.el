;; =============================== Ruby  =======================================

(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

;; ================================== Rvm ======================================

(require 'rvm)
(rvm-use-default)

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
