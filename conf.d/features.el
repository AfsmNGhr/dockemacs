;; ============================== Features =====================================

(use-package keyword-search :ensure t :defer t
  :bind ("C-c s" . keyword-search)
  :config
  (setq my/search-alist
        '((t/ya-en-ru . "https://translate.yandex.ru/?text=%s&lang=en-ru")
          (t/ya-ru-en . "https://translate.yandex.ru/?text=%s&lang=ru-en")
          (reddit . "https://www.reddit.com/search?q=%s"))
        keyword-search-alist (append keyword-search-alist my/search-alist)))

(use-package keyfreq :ensure t :defer 20
  :config
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1))

(unless (version< emacs-version "24.4")
  (use-package magit :ensure t :defer t)
  (use-package company-ansible :ensure t :defer t)
  (use-package docker :defer t :ensure t :config (docker-global-mode)))

;; ============================== Jump =========================================

(use-package ace-window :ensure t :defer t
  :init
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)
        aw-background nil))

(use-package ace-jump-mode :ensure t :defer t
  :bind
  ("C-c SPC" . ace-jump-word-mode)
  ("C-c v" . ace-jump-char-mode)
  ("C-c b" . ace-jump-line-mode))

;; ================================ Tags ======================================

(use-package ggtags :ensure t :defer t
  :init (ggtags-mode 1)
  :config
  (setq-local eldoc-documentation-function #'ggtags-eldoc-function))

;; ============================= Company ======================================

(use-package company :ensure t :defer t
  :init (global-company-mode t)
  :config (setq company-backends
                '((company-capf company-dabbrev-code company-files)))
  (use-package company-flx :ensure t :defer t
  :config (with-eval-after-load 'company
            (company-flx-mode +1)))
  (use-package company-tern :ensure t :defer t))

;; ============================= Snippets ======================================

(use-package yasnippet :ensure t :defer 30
  :config (yas-global-mode t)
  (setq yas-fallback-behavior 'indent-line))

;; ================================ Ido ========================================

(use-package ido-hacks :ensure t
  :config
  (use-package ido-completing-read+ :ensure t :defer t)
  (use-package flx-ido :ensure t
    :config
    (ido-mode 1)
    (ido-everywhere 1)
    (flx-ido-mode 1)
    (setq ido-enable-flex-matching t
          ido-use-faces t
          gc-cons-threshold 20000000)))

;; ============================= Bookmarks =====================================

(use-package bookmark
  :config
  (setq bookmark-save-flag t)
  (global-set-key (kbd "C-x r b")
   (lambda ()
     (interactive)
     (bookmark-jump
      (ido-completing-read "Jump to bookmark: " (bookmark-all-names))))))

;; ============================= Commands =====================================

(use-package smex :ensure t
  :config
   (smex-initialize)
   (smex-auto-update 600))

;; ============================= Projectile ===================================

(use-package projectile :ensure t :defer t
  :diminish projectile-mode
  :init (projectile-global-mode)
  :config
  (setq-default projectile-enable-caching t
                projectile-indexing-method 'native
                projectile-file-exists-remote-cache-expire nil
                projectile-file-exists-remote-cache-expire (* 10 60)
                projectile-file-exists-local-cache-expire (* 5 60)
                projectile-require-project-root nil
                projectile-idle-timer-seconds 60))

;; ========================= Multiple-cursors ================================

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
   ("C-c m d" . mc/mark-all-like-this-in-defun))
  :config
  (use-package phi-search :ensure t :defer t)
  (use-package phi-search-mc :ensure t :defer t
    :config (phi-search-mc/setup-keys))
  (use-package mc-extras :ensure t :defer t
    :config (define-key mc/keymap (kbd "C-. =") 'mc/compare-chars)))

;; ========================= To be continued... ================================
