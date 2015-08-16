;; =============================== Ruby  =======================================

(use-package ruby-mode
  :defer t
  :mode "\\.rb\\'"
  :interpreter "ruby"
  :config
  (add-hook 'ruby-mode-hook 'rubocop-mode))

(use-package rubocop
  :defer t)

(use-package rvm
  :defer t
  :init
  (rvm-use-default))

(use-package rhtml-mode
  :defer t
  :init
  (add-hook 'rhtml-mode-hook 'smartparens-mode)
  :config
  (sp-with-modes '(rhtml-mode)
               (sp-local-pair "<" ">")
               (sp-local-pair "<%" "%>")))

(use-package smartparens
  :defer t
  :init
  (show-smartparens-global-mode t))

(use-package rspec-mode
  :defer t
  :config
  (eval-after-load 'rspec-mode
    '(rspec-install-snippets)))

;; ========================= To be continued... ================================
