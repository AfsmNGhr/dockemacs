;; ============================== Features =====================================

(use-package ace-window :ensure t :defer t
  :init
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  (setq aw-background nil))

(use-package ace-jump-mode :ensure t
  :config
  (define-key global-map (kbd "C-c SPC") 'ace-jump-word-mode)
  (define-key global-map (kbd "C-c v") 'ace-jump-char-mode)
  (define-key global-map (kbd "C-c b") 'ace-jump-line-mode))

(use-package magit :ensure t :defer t)

(use-package auto-complete :ensure t :defer t
  :init (global-auto-complete-mode))

(use-package yasnippet
  :ensure t :defer t
  :config (yas-global-mode 1))

(use-package flx-ido :ensure t
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

(use-package smex :ensure t
  :config
   (smex-initialize)
   (smex-auto-update 600))

(use-package projectile :ensure t :defer t
  :diminish projectile-mode
  :init (projectile-global-mode)
  :config
  (setq-default projectile-enable-caching t
        projectile-indexing-method 'native))

(use-package perspective :ensure t :defer t
  :init
  (persp-mode))

(use-package multiple-cursors :ensure t :defer t
  :bind
  (("C-c m t" . mc/mark-all-like-this)
   ("C-c m m" . mc/mark-all-like-this-dwim)
   ("C-c m l" . mc/edit-lines)
   ("C-c m e" . mc/edit-ends-of-lines)
   ("C-c m a" . mc/edit-beginnings-of-lines)
   ("C-c m n" . mc/mark-next-like-this)
   ("C-c m p" . mc/mark-previous-like-this)
   ("C-c m s" . mc/mark-sgml-tag-pair)
   ("C-c m d" . mc/mark-all-like-this-in-defun)))

(use-package phi-search :ensure t :defer t)

(use-package phi-search-mc :ensure t :defer t
  :config
  (phi-search-mc/setup-keys))

(use-package mc-extras :ensure t :defer t
  :config
      (define-key mc/keymap (kbd "C-. =") 'mc/compare-chars))

;; ========================= To be continued... ================================
