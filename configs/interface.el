;; =========================== Interface  ==================================

;; ;;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
;; (set-frame-parameter (selected-frame) 'alpha '(90 50))
;; (add-to-list 'default-frame-alist '(alpha 90 50))

(setq file-name-coding-system 'utf-8)
(fset 'yes-or-no-p 'y-or-n-p)
(setq display-time-interval 1)
(setq display-time-format "%H:%M")
(display-time-mode)
(setq-default tab-width 2)
(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("5b6a7f2a00275a5589b14fa23ff1699785d9f7c1722ee9f79ec1b7de92fa0935" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12")))
 '(delete-selection-mode t)
 '(ergoemacs-ctl-c-or-ctl-x-delay 0.2)
 '(ergoemacs-handle-ctl-c-or-ctl-x (quote both))
 '(ergoemacs-keyboard-layout "us")
 '(ergoemacs-smart-paste nil)
 '(ergoemacs-use-menus t)
 '(fringe-mode 0 nil (fringe))
 '(global-whitespace-mode t)
 '(initial-buffer-choice t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(initial-scratch-message nil)
 '(org-CUA-compatible nil)
 '(org-replace-disputed-keys nil)
 '(org-timer-display nil)
 '(org-use-effective-time nil)
 '(recentf-menu-before nil)
 '(recentf-mode t)
 '(shift-select-mode nil)
 '(smex-prompt-string nil)
 '(whitespace-style (quote (face lines-tail))))

(add-hook 'before-save-hook
          'delete-trailing-whitespace)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(icicle-multi-command-completion ((t (:foreground "#0000D53CD53C"))))
 '(icicle-mustmatch-completion ((t (:box (:line-width -2 :color "dodger blue")))))
 '(whitespace-empty ((t (:background "VioletRed1" :foreground "DeepPink4")))))

(setq make-backup-files nil) ; Don't want any backup files
(setq auto-save-list-file-name nil) ; Don't want any .saves files
(setq auto-save-default nil) ; Don't want any auto saving

(delete-selection-mode t)
(transient-mark-mode t)
(setq x-select-enable-clipboard t)

(setq show-paren-style 'expression)
(show-paren-mode 1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b"))))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'spolsky)

;; ====================== To be continued... ==========================
