;; =============================== Ruby  =======================================

(use-package ruby-mode :defer t
  :mode (("\\.cr\\'" . ruby-mode)
         (".irbrc" . ruby-mode)))

(use-package bundler :ensure t :defer t)
(use-package rvm :ensure t :defer t :init (rvm-use-default))
(use-package company-inf-ruby :ensure t :defer t)

(use-package rubocop :ensure t :defer t
  :init (add-hook 'ruby-mode-hook 'rubocop-mode)
  (add-to-list 'ruby-mode-hook 'flycheck-mode)
  (if (version< emacs-version "24.4")
      (eval-after-load 'flycheck-mode
        '(progn (flycheck-add-mode 'ruby-rubocop 'ruby-mode)))
    (with-eval-after-load 'flycheck-mode
      (flycheck-add-mode 'ruby-rubocop 'ruby-mode))))

(use-package rspec-mode :ensure t :defer t
  :config
  (eval-after-load 'rspec-mode
    '(rspec-install-snippets)))

;; ========================= To be continued... ================================
