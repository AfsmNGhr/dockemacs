;; ============================== Features =====================================

(use-package keyfreq :ensure t :defer 20
  :config
  (setq keyfreq-excluded-commands
        '(self-insert-command
          forward-char
          backward-char
          previous-line
          next-line))
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1))

(unless (version< emacs-version "24.4")
  (use-package magit :ensure t :defer t
    :config (setq magit-completing-read-function 'magit-ido-completing-read))
  (use-package git-timemachine :ensure t :defer t)
  (use-package docker :defer t :ensure t :config (docker-global-mode)))

;; ============================== Jump =========================================

(use-package ace-window :ensure t :defer t
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l)
        aw-background nil))

;; ============================== Search =======================================

(use-package keyword-search :ensure t :defer t
  :bind ("C-c s" . keyword-search)
  :config
  (setq my/search-alist
        '((t/ya-en-ru . "https://translate.yandex.ru/m/translate?text=%s&lang=en-ru")
          (t/ya-ru-en . "https://translate.yandex.ru/m/translate?text=%s&lang=ru-en")
          (reddit . "https://www.reddit.com/search?q=%s"))
        keyword-search-alist (append keyword-search-alist my/search-alist)))

(use-package ido-hacks :ensure t
  :config
  (use-package flx-ido :ensure t
    :config
    (ido-mode 1)
    (ido-everywhere 1)
    (flx-ido-mode 1)
    (setq ido-enable-flex-matching t
          ido-use-faces t
          gc-cons-threshold 10000000))
  (use-package ido-ubiquitous :ensure t
    :config (ido-ubiquitous-mode 1)))

;; ================================ Tags ======================================

(use-package ggtags :ensure t :defer t
  :init (ggtags-mode 1)
  :config
  (setq-local eldoc-documentation-function #'ggtags-eldoc-function))

(use-package gxref :ensure t :defer t
  :if (version<= emacs-version "25.1")
  :init (add-to-list 'xref-backend-functions 'gxref-xref-backend))

;; ============================= Company ======================================

(use-package company :ensure t :defer 30
  :init (global-company-mode t)
  :config
  (defvar company-mode/enable-yas t
    "Enable yasnippet for all backends.")

  (defun company-mode/backend-with-yas (backend)
    (if (or (not company-mode/enable-yas)
            (and (listp backend)
                 (member 'company-yasnippet backend)))
        backend
      (append (if (consp backend) backend (list backend))
              '(:with company-yasnippet))))

  (setq company-backends
        (mapcar #'company-mode/backend-with-yas
                '((company-capf company-shell company-dabbrev company-abbrev
                                company-files company-gtags company-etags
                                company-keywords)))
        company-idle-delay 1.0
        company-tooltip-flip-when-above t)
  (use-package company-flx :ensure t :defer t
    :config (with-eval-after-load 'company
              (company-flx-mode +1)))
  (use-package company-ycmd :ensure t :defer t
    :config (company-ycmd-setup))
  (use-package company-tern :ensure t :defer t)
  (use-package company-shell :ensure t :defer t)
  (use-package company-statistics :ensure t :defer t
    :init (company-statistics-mode)))

;; ============================= Checkers ======================================

(use-package flycheck :ensure t
  :init (global-flycheck-mode))

;; ============================= Snippets ======================================

(use-package yasnippet :ensure t :defer 30
  :config
  (yas-global-mode t)
  (yas-load-directory (concat my/emacs-dir) "/snippets/angular")
  (setq yas-fallback-behavior 'indent-line))

;; ============================= Bookmarks =====================================

(use-package bookmark
  :config
  (setq bookmark-save-flag t)
  (global-set-key (kbd "C-x r b")
                  (lambda ()
                    (interactive)
                    (bookmark-jump
                     (ido-completing-read "jump to bookmark: "
                                          (bookmark-all-names))))))

;; ============================= Projectile ===================================

(use-package projectile :ensure t :defer t
  :diminish projectile-mode
  :init (projectile-global-mode)
  :config
  (setq-default projectile-enable-caching t
                projectile-indexing-method 'alien
                projectile-switch-project-action 'projectile-dired
                projectile-file-exists-remote-cache-expire nil
                projectile-file-exists-remote-cache-expire (* 10 60)
                projectile-file-exists-local-cache-expire (* 5 60)
                projectile-require-project-root nil
                projectile-idle-timer-seconds 60
                projectile-completion-system 'ido))

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
    :config (define-key mc/keymap (kbd "c-. =") 'mc/compare-chars)))

;; ========================= to be continued... ================================
