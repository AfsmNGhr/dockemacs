;; =========================== Templates...  ===================================

(use-package markdown-mode :ensure t :defer t)
(use-package sass-mode :ensure t :defer t
  :mode
  (("\\.scss" . sass-mode)))
(use-package less-css-mode :ensure t :defer t)
(use-package haml-mode :ensure t :defer t)
(use-package slim-mode :ensure t :defer t)
(use-package csv-mode :ensure t :defer t)
(use-package yaml-mode :ensure t :defer t)
(use-package sqlplus :ensure t :defer t)
(use-package dockerfile-mode :ensure t :defer t)
(use-package ansible :ensure t :defer t
  :config (add-hook 'yaml-mode-hook '(lambda () (ansible 1))))

;; ========================= To be continued... ================================
