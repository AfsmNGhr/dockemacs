;; ================================ Auto-complete ==============================

(add-to-list 'load-path "~/.emacs.d/plugins/features/auto-complete")

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/features/auto-complete/ac-dict")
(ac-config-default)
(setq-default ac-sources (add-to-list 'ac-sources 'ac-source-dictionary))
(global-auto-complete-mode 1)
(setq ac-auto-start 2)
(setq ac-ignore-case nil)

(add-to-list 'load-path "~/.emacs.d/plugins/features")

(require 'linum+)
(setq linum-format "%d ")
(global-linum-mode 1)

(require 'ido-hacks)
(ido-mode t)
(setq ido-enable-flex-matching t)

(add-to-list 'load-path "~/.emacs.d/plugins/features/multiple-cursors")

(require 'multiple-cursors)
(global-set-key (kbd "C-x C-m") 'mc/edit-lines)
(global-set-key (kbd "C-.") 'mc/mark-next-like-this)
(global-set-key (kbd "C-,") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-,") 'mc/mark-all-like-this)

(require 'autopair)
(autopair-global-mode)

(require 'flyspell)
(setq flyspell-issue-message-flg nil)
(add-hook 'ruby-mode-hook
          (lambda () (flyspell-prog-mode)))

(setq-default ispell-program-name "aspell")
(setq ispell-local-dictionary "russian")

;; ================================ Bookmark ===================================

(global-set-key (kbd "C-x r b")
    (lambda ()
      (interactive)
      (bookmark-jump
       (ido-completing-read "Jump to bookmark: " (bookmark-all-names)))))

(global-set-key (kbd "C-x v")         'bookmark-set)
(global-set-key (kbd "s-SPC")         'bookmark-save)

;; ========================= To be continued... ================================
