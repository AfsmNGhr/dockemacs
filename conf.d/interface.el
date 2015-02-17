;; ================================ Interface ================================

;; ;;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
;; (set-frame-parameter (selected-frame) 'alpha '(90 50))
;; (add-to-list 'default-frame-alist '(alpha 90 50))

(fset 'yes-or-no-p 'y-or-n-p)

(custom-set-variables
 '(whitespace-style '(face lines-tail)))

(setq-default tab-width 2
              indent-tabs-mode nil
              file-name-coding-system 'utf-8
              display-time-interval 1
              display-time-format "%H:%M"
              make-backup-files nil
              auto-save-list-file-name nil
              auto-save-default nil
              show-paren-style 'expression
              word-wrap t
              search-highlight t
              use-dialog-box nil
              redisplay-dont-pause t
              ring-bell-function 'ignore
              query-replace-highlight t)

(display-time-mode)
(show-paren-mode 1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(column-number-mode -1)
(blink-cursor-mode -1)
(line-number-mode -1)
(size-indication-mode -1)
(global-visual-line-mode t)
(global-font-lock-mode t)
(delete-selection-mode t)
(global-whitespace-mode t)

;; =============================== Theme =======================================

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(if (daemonp)
    (progn
      (load-theme 'spolsky t)
      (load-theme 'spolsky-term t t))
  (load-theme 'spolsky t))

(defun my/enable-theme (frame)
  "enable theme the current frame depending on the frame type"
  (with-selected-frame frame
    (if (window-system)
        (progn
          (unless (custom-theme-enabled-p 'spolsky)
            (disable-theme 'spolsky-term)
            (enable-theme 'spolsky)))
      (progn
        (unless (custom-theme-enabled-p 'spolsky-term)
          (disable-theme 'spolsky)
          (enable-theme 'spolsky-term))))))

(add-hook 'after-make-frame-functions 'my/enable-theme)

;; ========================= To be continued... ================================
