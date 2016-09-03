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
(use-package web-mode :ensure t :defer t
  :config
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (setq web-mode-markup-indent-offset 2
        web-mode-enable-auto-pairing t
        web-mode-enable-current-element-highlight t
        web-mode-enable-block-face t
        web-mode-enable-part-face t))

;; ========================= To be continued... ================================
