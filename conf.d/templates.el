;; =========================== Templates...  ===================================

(use-package markdown-mode :ensure t :defer t)
(use-package css-mode :ensure t :defer t)
(use-package sass-mode :ensure t :defer 60
  :mode (("\\.scss" . sass-mode)))
(use-package haml-mode :ensure t :defer t)
(use-package slim-mode :ensure t :defer t)
(use-package csv-mode :ensure t :defer t)
(use-package yaml-mode :ensure t :defer t)
(use-package sqlplus :ensure t :defer t)
(use-package dockerfile-mode :ensure t :defer t)
(use-package company-web :ensure t :defer 30)

;; ========================= To be continued... ================================
