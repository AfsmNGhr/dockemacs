;; =============================== Ruby  =======================================

(add-hook 'ruby-mode-hook 'flymake-ruby-load)

;; ================================== Rvm ======================================

(rvm-use-default)

;; ================================= Rubocop ===================================

(add-hook 'ruby-mode-hook 'rubocop-mode)

;; ============================= Smartparens ===================================

(add-hook 'rhtml-mode-hook 'smartparens-mode)
(show-smartparens-global-mode t)
(sp-with-modes '(rhtml-mode)
               (sp-local-pair "<" ">")
               (sp-local-pair "<%" "%>"))

;; =================================== Rspec ===================================

(eval-after-load 'rspec-mode
  '(rspec-install-snippets))

;; ========================= To be continued... ================================
