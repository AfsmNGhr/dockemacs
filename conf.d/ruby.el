;; =============================== Ruby  =======================================

(use-package ruby-mode :defer t
  :mode (("\\.cr\\'" . ruby-mode)
         (".irbrc" . ruby-mode)))

(use-package bundler :ensure t :defer t)
(use-package rvm :ensure t :defer t :init (rvm-use-default))
(use-package company-inf-ruby :ensure t :defer t)

(use-package rubocop :ensure t :defer t
  :init (add-hook 'ruby-mode-hook 'rubocop-mode)
  (push 'ruby-rubocop flycheck-checkers)
  (add-to-list 'ruby-mode-hook 'flycheck-mode))

(use-package robe :ensure t :defer t
  :init
  (progn (add-hook 'ruby-mode-hook 'robe-mode)
         (push 'company-robe company-backends)))

(use-package mmm-mode :ensure t :defer t
  :mode
  (("\\.jst\\.eco$" . html-erb-mode)
   ("\\.html\\.erb$" . html-erb-mode)))

(use-package rspec-mode :ensure t :defer t
  :config
  (eval-after-load 'rspec-mode
    '(rspec-install-snippets)))

;; ========================= To be continued... ================================
