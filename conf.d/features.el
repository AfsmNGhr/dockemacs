;; ============================== Features =====================================

(use-package auto-complete
  :ensure t :defer t
  :init (global-auto-complete-mode))

(use-package yasnippet
  :ensure t :defer t
  :config (yas-global-mode 1))

(use-package flx-ido
  :ensure t
  :config
  (ido-mode 1)
  (ido-everywhere 1)
  (flx-ido-mode 1)
  (setq ido-enable-flex-matching t
        ido-use-faces t
        gc-cons-threshold 20000000))

(electric-pair-mode 1)

(use-package bookmark
  :config
  (setq bookmark-save-flag t)
  (global-set-key (kbd "C-x v") 'bookmark-set)
  (global-set-key (kbd "s-SPC") 'bookmark-save)
  (global-set-key (kbd "C-x r b")
    (lambda ()
      (interactive)
      (bookmark-jump
       (ido-completing-read "Jump to bookmark: " (bookmark-all-names))))))

(use-package smex
  :ensure t :defer t
  :config
  (smex-initialize)
  (smex-auto-update 600))

(use-package projectile
  :ensure t :defer t
  :diminish projectile-mode
  :init (projectile-global-mode)
  :config
  (setq-default projectile-enable-caching t
        projectile-indexing-method 'native))

(use-package perspective
  :ensure t :defer t
  :init
  (persp-mode))

(use-package multiple-cursors
  :ensure t :defer t
  :bind (("C-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)
         ("s-SPC" . set-rectangular-region-anchor)))

;; ========================= To be continued... ================================
