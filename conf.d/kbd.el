;; ================================= My keys ===================================

(global-set-key (kbd "C-v") 'end-of-buffer)
(global-set-key (kbd "M-v") 'beginning-of-buffer)

(global-set-key (kbd "C-b") 'backward-char)
(global-set-key (kbd "C-f") 'forward-char)
(global-set-key (kbd "C-p") 'previous-line)
(global-set-key (kbd "C-M-b") 'backward-paragraph)
(global-set-key (kbd "C-M-f") 'forward-paragraph)

(global-set-key (kbd "C-x w") 'kill-buffer-and-window)
(global-set-key (kbd "C-z") 'undo)

(global-set-key (kbd "C-x o") 'ace-window)
(global-set-key (kbd "C-c t") 'ggtags-grep)

(global-set-key (kbd "C-w") 'clipboard-kill-region)
(global-set-key (kbd "M-w") 'clipboard-kill-ring-save)

(global-set-key (kbd "C-y") 'clipboard-yank)
(global-set-key (kbd "M-q") 'query-replace-regexp)

(global-set-key [remap comment-dwim] 'comment-or-uncomment-region-or-line)

(global-set-key (kbd "C-x 2") 'start-kbd-macro)
(global-set-key (kbd "C-x 3") 'end-kbd-macro)
(global-set-key (kbd "C-x e") 'call-last-kbd-macro)

;; ========================= To be continued... ================================
