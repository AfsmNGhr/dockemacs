;; ================================ Interface ================================

;; ;;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
;; (set-frame-parameter (selected-frame) 'alpha '(90 50))
;; (add-to-list 'default-frame-alist '(alpha 90 50))

(fset 'yes-or-no-p 'y-or-n-p)

(custom-set-variables
 '(custom-safe-themes
   '("0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12"))
 '(delete-selection-mode t)
 '(ergoemacs-ctl-c-or-ctl-x-delay 0.2)
 '(ergoemacs-handle-ctl-c-or-ctl-x 'both)
 '(ergoemacs-keyboard-layout "us")
 '(ergoemacs-use-menus t)
 '(global-whitespace-mode t)
 '(initial-frame-alist '((fullscreen . maximized)))
 '(initial-scratch-message
   ";; This buffer is for notes you don't want to save, and for Lisp evaluation.
    ;; If you want to create a file, visit that file with [Ctrl+O],
    ;; then enter the text in that file's own buffer.")
 '(whitespace-style '(face lines-tail)))

(setq-default tab-width 2
              indent-tabs-mode nil)

(setq file-name-coding-system 'utf-8
      display-time-interval 1
      display-time-format "%H:%M"
      make-backup-files -1
      auto-save-list-file-name -1
      auto-save-default -1
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

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'spolsky)

;; ========================= To be continued... ================================
