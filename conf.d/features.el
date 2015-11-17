;; ============================== Features =====================================

(use-package counsel :ensure t)

(use-package swiper :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (global-set-key "\C-s" 'swiper)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)
  (global-set-key (kbd "<f6>") 'ivy-resume)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "<f1> f") 'counsel-describe-function)
  (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
  (global-set-key (kbd "<f1> l") 'counsel-load-library)
  (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
  (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
  (global-set-key (kbd "C-c g") 'counsel-git)
  (global-set-key (kbd "C-c j") 'counsel-git-grep)
  (global-set-key (kbd "C-c k") 'counsel-ag)
  (global-set-key (kbd "C-x l") 'counsel-locate))

(use-package keyfreq :ensure t
  :config
  (keyfreq-mode 1)
  (keyfreq-autosasve-mode 1))

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

(use-package smex :ensure t :defer t
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
