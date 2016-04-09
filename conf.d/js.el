;; ================================== JS =======================================

(use-package coffee-mode :ensure t :defer t
  :config (setq-default coffee-js-mode 'js2-mode coffee-tab-width 2))

(use-package js2-mode :ensure t :defer t
  :mode (("\\.js\\'" . js2-mode)
         ("\\.json\\'" . javascript-mode))
  :commands js2-mode
  :init (progn
          (setq-default js2-basic-offset 2
                        js2-indent-switch-body t)
          (add-to-list 'interpreter-mode-alist (cons "node" 'js2-mode)))
  :config (progn
            (js2-imenu-extras-setup)
            (bind-key "C-x C-e" 'js-send-last-sexp js2-mode-map)
            (bind-key "C-M-x" 'js-send-last-sexp-and-go js2-mode-map)
            (bind-key "C-c b" 'js-send-buffer js2-mode-map)
            (bind-key "C-c C-b" 'js-send-buffer-and-go js2-mode-map)
            (bind-key "C-c l" 'js-load-file-and-go js2-mode-map)))

(use-package skewer-mode :ensure t :defer t
  :init (skewer-mode 1))
(use-package tern :ensure t :defer t
  :init (add-hook 'js2-mode-hook 'tern-mode)
  (add-to-list 'company-backends 'company-tern))
(use-package angular-snippets :ensure t :defer t)

;; ========================= To be continued... ================================
