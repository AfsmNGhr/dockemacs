;; =========================== Interface  ==================================

(add-to-list 'load-path "~/.emacs.d/")

;;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
(set-frame-parameter (selected-frame) 'alpha '(85 50))
(add-to-list 'default-frame-alist '(alpha 85 50))

(setq file-name-coding-system 'utf-8) 
(fset 'yes-or-no-p 'y-or-n-p) 
(setq display-time-interval 1)
(setq display-time-format "%H:%M:%S")
(display-time-mode)
(setq-default tab-width 4)

(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

(setq make-backup-files nil) ; Don't want any backup files
(setq auto-save-list-file-name nil) ; Don't want any .saves files
(setq auto-save-default nil) ; Don't want any auto saving

(setq show-paren-style 'expression)
(show-paren-mode 1)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes") 
(load-theme 'spolsky t)

;; =========================== Org mode  ==================================

(add-to-list 'load-path "~/.emacs.d/org-mode/contrib/lisp" t)
(setq org-todo-keywords
'((sequence "TODO" "FEEDBACK" "VERIFY" "FREEZING" "|" "DONE" "DELEGATED")))

;; =========================== Features  ==================================

(require 'linum+)
(setq linum-format "%d ")
(global-linum-mode 1)

(require 'ido-hacks)
(ido-mode t)
(setq ido-enable-flex-matching t)

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(add-to-list 'load-path "~/.emacs.d/auto-complete-1.3.1")
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete-1.3.1/dict")

;; =========================== Keybinding  ==================================

(add-to-list 'load-path "~/.emacs.d/ergoemacs-mode")
(require 'ergoemacs-mode)

(setq ergoemacs-theme nil) ;; Uses Standard Ergoemacs keyboard theme
(setq ergoemacs-keyboard-layout "us") ;; Assumes QWERTY keyboard layout
(ergoemacs-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ergoemacs-ctl-c-or-ctl-x-delay 0.2)
 '(ergoemacs-handle-ctl-c-or-ctl-x (quote both))
 '(ergoemacs-keyboard-layout "us")
 '(ergoemacs-mode-used "5.13.12-3")
 '(ergoemacs-smart-paste nil)
 '(ergoemacs-theme nil)
 '(ergoemacs-use-menus t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; =========================== Snippets  ==================================

(add-to-list 'load-path
              "~/.emacs.d/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"                 ;; personal snippets
        "~/.emacs.d/some/collection/"           ;; foo-mode and bar-mode snippet collection
        "~/.emacs.d/yasnippet/yasmate/snippets" ;; the yasmate collection
        "~/.emacs.d/yasnippet/snippets"         ;; the default collection
        ))

(yas-global-mode 1) ;; or M-x yas-reload-all if you've started YASnippet already.


;; =========================== Packages  ==================================

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
 (with-current-buffer
     (url-retrieve-synchronously
      "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
   (goto-char (point-max))
   (eval-print-last-sexp)))
(setq el-get-sources '(multiple-cursors json scss-mode coffee-mode web-mode auto-complete-css))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

;; =========================== Rails  ==================================

;; Interactively Do Things (highly recommended, but not strictly required)
(require 'ido)
(ido-mode t)

;; Rinari
(add-to-list 'load-path "~/.emacs.d/rinari")
(require 'rinari)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.eco\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jst\\.eco\\'" . web-mode))

(require 'coffee-mode)
(add-to-list 'auto-mode-alist
            '("\\.coffee$" . rinari-minor-mode)
            '("\\.coffee$" . coffee-mode)
            )

(eval-after-load "coffee-mode"
 '(progn
    (define-key coffee-mode-map [(meta r)] 'coffee-compile-buffer)
    (define-key coffee-mode-map (kbd "C-j") 'coffee-newline-and-indent)))

(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

;; ====================== To be continued... ==========================

