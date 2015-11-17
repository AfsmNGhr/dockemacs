;; ================================= Custom ====================================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(delete-selection-mode t)
 '(global-linum-mode t)
 '(global-whitespace-mode t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(initial-scratch-message
   #(";; This buffer is for notes you don't want to save, and for Lisp evaluation.
;; If you want to create a file, visit that file with Ctrl+O,
;; then enter the text in that file's own buffer." 131 135
                                                       (face ergoemacs-pretty-key)
                                                       136 137
                                                       (face ergoemacs-pretty-key)))
 '(ivy-use-virtual-buffers t)
 '(linum-format " %i ")
 '(org-CUA-compatible nil)
 '(org-agenda-files
   (quote
    ("/home/afsmnghr/Documents/org/work.org" "/home/afsmnghr/Documents/org/diary.org")))
 '(org-replace-disputed-keys nil)
 '(org-special-ctrl-a/e t)
 '(org-support-shift-select t)
 '(recentf-menu-before "Close")
 '(recentf-mode t)
 '(scroll-error-top-bottom t)
 '(set-mark-command-repeat-pop t)
 '(shift-select-mode t)
 '(smex-prompt-string
   #("Alt+X " 0 3
     (face ergoemacs-pretty-key)
     4 5
     (face ergoemacs-pretty-key)))
 '(whitespace-style (quote (face lines-tail))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ivy-current-match ((t (:foreground "color-35"))))
 '(ivy-minibuffer-match-face-2 ((t (:foreground "#f78d62" :weight bold))))
 '(ivy-minibuffer-match-face-3 ((t (:background "color-27" :weight bold))))
 '(ivy-minibuffer-match-face-4 ((t (:background "color-164" :weight bold))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "color-31"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "color-26")))))
;; ========================= To be continued... ================================
