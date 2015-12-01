;; =========================== Templates...  ===================================

(use-package markdown-mode :ensure t :defer t)
(use-package sass-mode :ensure t :defer t
  :mode (("\\.scss" . sass-mode)))
(use-package less-css-mode :ensure t :defer t)
(use-package haml-mode :ensure t :defer t)
(use-package slim-mode :ensure t :defer t)
(use-package csv-mode :ensure t :defer t)
(use-package yaml-mode :ensure t :defer t
  :config (add-to-list 'company-backends 'company-ansible))
(use-package sqlplus :ensure t :defer t)
(use-package dockerfile-mode :ensure t :defer t)
(use-package company-web :ensure t :defer t
  :config (add-hook 'html-mode 'angular-html-mode))

;; ========================= To be continued... ================================
