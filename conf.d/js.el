;; ================================== JS =======================================

(use-package coffee-mode :ensure t :defer t
  :config (setq-default coffee-js-mode 'js2-mode coffee-tab-width 2))

(use-package typescript-mode :ensure t :defer t
  :config
  (add-to-list 'typescript-mode-hook 'flycheck-mode)
  (add-to-list 'typescript-mode-hook (lambda () (tide-setup)))
  (setq typescript-indent-level 2
        tide-format-options '(:placeOpenBraceOnNewLineForFunctions t :placeOpenBraceOnNewLineForControlBlocks t)
        company-tooltip-align-annotations t))

(use-package tide :ensure t :defer t)

(use-package js2-mode :ensure t :defer t
  :mode (("\\.js\\'" . js2-mode)
         ("\\.json\\'" . javascript-mode))
  :commands js2-mode
  :config (setq-default js2-basic-offset 2
                        js-indent-level 2
                        js2-indent-switch-body t
                        js2-auto-indent-p t
                        js2-highlight-level 3
                        js2-global-externs '("angular")
                        js2-indent-on-enter-key t)
  (setq flycheck-disabled-checkers '(javascript-jshint)
        flycheck-eslintrc "~/.eslintrc.yml")
  (add-to-list 'js2-mode-hook 'flycheck-mode)
  (add-to-list 'js2-mode-hook 'tern-mode)
  (add-hook 'js2-mode-hook #'js2-refactor-mode)
  (add-hook 'js2-mode-hook
            (lambda ()
              (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t))))

(use-package tern :ensure t :defer t
  :config
  (add-to-list 'company-backends 'company-tern)
  (define-key tern-mode-keymap (kbd "M-.") nil)
  (define-key tern-mode-keymap (kbd "M-,") nil))

(use-package js2-refactor :ensure t :defer t
  :config
  (js2r-add-keybindings-with-prefix "C-c C-f")
  (define-key js2-mode-map (kbd "C-k") #'js2r-kill))

(use-package xref-js2 :ensure t :defer t
  :config
  (define-key js-mode-map (kbd "M-.") nil))

;; ========================= To be continued... ================================
