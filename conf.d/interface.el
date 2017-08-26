;; ================================ Interface ================================

;; (set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
;; (set-frame-parameter (selected-frame) 'alpha '(90 50))
;; (add-to-list 'default-frame-alist '(alpha 90 50))

(fset 'yes-or-no-p 'y-or-n-p)

(custom-set-variables
 '(whitespace-style '(face lines-tail))
 '(org-babel-load-languages
   (quote ((emacs-lisp . t) (sh . t) (ruby . t) (js . t))))
 '(org-confirm-babel-evaluate nil))

(custom-set-faces
 '(aw-leading-char-face
   ((t (:inherit ace-jump-face-foreground :height 3.0)))))

(setq-default tab-width 2
              indent-tabs-mode nil
              file-name-coding-system 'utf-8
              display-time-interval 1
              display-time-format "%H:%M"
              make-backup-files nil
              auto-save-list-file-name nil
              auto-save-default nil
              show-paren-style 'mixed
              history-length t
              history-delete-duplicates t
              savehist-save-minibuffer-history 1
              savehist-autosave-interval 60
              savehist-additional-variables '(search-ring regexp-search-ring
                                                          comint-input-ring)
              dired-listing-switches "-lhvA"
              magit-push-always-verify nil
              epa-pinentry-mode 'loopback
              word-wrap t
              search-highlight t
              use-dialog-box nil
              use-file-dialog nil
              redisplay-dont-pause t
              ring-bell-function 'ignore
              query-replace-highlight t
              x-select-enable-clipboard t
              echo-keystrokes 0.1
              enable-local-eval t
              enable-remote-dir-locals t
              browse-url-browser-function 'browse-url-generic
              browse-url-generic-program "/usr/local/sbin/browser-remote"
              tab-always-indent 'complete
              garbage-collection-messages t
              electric-pair-pairs '((?\" . ?\")
                                    (?\` . ?\`)
                                    (?\( . ?\))
                                    (?\{ . ?\})))

(display-time-mode)
(show-paren-mode t)
(menu-bar-mode -1)
(if tool-bar-mode
    (tool-bar-mode -1))
(column-number-mode -1)
(blink-cursor-mode -1)
(line-number-mode -1)
(size-indication-mode -1)
(global-visual-line-mode t)
(global-font-lock-mode t)
(global-auto-revert-mode t)
(delete-selection-mode t)
(global-whitespace-mode t)
(auto-revert-mode t)
(recentf-mode 1)
(global-linum-mode t)
(electric-pair-mode 1)
(savehist-mode 1)
(auto-fill-mode 1)

;; =============================== UTF-8 =======================================

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(ansi-color-for-comint-mode-on)
(setq buffer-file-coding-system 'utf-8
      x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; ============================ Delimiters =====================================

(use-package rainbow-delimiters :ensure t :defer t
  :init
  (dolist (x '(cl emacs-lisp lisp clojure))
    (add-hook
     (intern (concat (symbol-name x) "-mode-hook"))
     #'rainbow-delimiters-mode)))

;; =============================== Theme =======================================

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(defun my/load-theme ()
  "load my theme"
  (if (display-graphic-p)
      (load-theme 'spolsky t)
    (load-theme 'spolsky-term t)))

(defun my/enable-theme (frame)
  "enable theme the current frame depending on the frame type"
  (with-selected-frame frame
    (if (window-system)
        (progn
          (unless (custom-theme-enabled-p 'spolsky)
            (if (custom-theme-enabled-p 'spolsky-term)
                (disable-theme 'spolsky-term))
            (enable-theme 'spolsky)))
      (progn
        (unless (custom-theme-enabled-p 'spolsky-term)
          (if (custom-theme-enabled-p 'spolsky)
              (disable-theme 'spolsky))
          (enable-theme 'spolsky-term))))))

(add-hook 'after-init-hook 'my/load-theme)
(add-hook 'after-make-frame-functions 'my/enable-theme)

;; ========================= To be continued... ================================
