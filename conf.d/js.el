;; ================================== JS =======================================

(use-package coffee-mode :ensure t :defer t
  :config (setq-default coffee-js-mode 'js2-mode coffee-tab-width 2))

(use-package js2-mode :ensure t :defer t
  :mode (("\\.js\\'" . js2-mode)
         ("\\.json\\'" . javascript-mode))
  :commands js2-mode
  :config (setq-default js2-basic-offset 2
                        js2-indent-switch-body t
                        js2-auto-indent-p t
                        js2-highlight-level 3
                        js2-global-externs '("angular")
                        js2-indent-on-enter-key t))

(use-package tern :ensure t :defer t
  :config (add-hook 'javascript-hook 'tern-mode)
  (add-to-list 'company-backends 'company-tern))

(defun reset-eslint-rc
    (let ((rc-path (if (projectile-project-p)
                       (concat (projectile-project-root) ".eslintrc"))))
      (if (file-exists-p rc-path)
          (progn
            (message rc-path)
            (setq flycheck-eslintrc rc-path)))))

(add-hook 'flycheck-mode-hook 'reset-eslint-rc)

;; ========================= To be continued... ================================
