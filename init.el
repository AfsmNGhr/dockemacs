(add-to-list 'load-path "~/.emacs.d/")

<<<<<<< HEAD
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

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

=======
>>>>>>> 58a6a76032836e82a5f72d1f889e91ce1b7b04ee
(setq make-backup-files nil) ; Don't want any backup files
(setq auto-save-list-file-name nil) ; Don't want any .saves files
(setq auto-save-default nil) ; Don't want any auto saving

(setq show-paren-style 'expression)
(show-paren-mode 1)

(menu-bar-mode -1)
(tool-bar-mode -1)
<<<<<<< HEAD
(scroll-bar-mode -1)
=======
>>>>>>> 58a6a76032836e82a5f72d1f889e91ce1b7b04ee

(add-to-list 'load-path "~/.emacs.d/org-mode/contrib/lisp" t)

(setq org-todo-keywords
<<<<<<< HEAD
'((sequence "TODO" "FEEDBACK" "VERIFY" "FREEZING" "|" "DONE" "DELEGATED")))
=======
'((sequence "TODO" "FEEDBACK" "VERIFY" "|" "DONE" "DELEGATED")))
>>>>>>> 58a6a76032836e82a5f72d1f889e91ce1b7b04ee

(require 'linum+)
(setq linum-format "%d ")
(global-linum-mode 1)

(require 'ido-hacks)
(ido-mode t)
(setq ido-enable-flex-matching t)

(add-to-list 'load-path "~/.emacs.d/auto-complete-1.3.1")
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete-1.3.1/dict")

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

<<<<<<< HEAD
=======
(require 'sr-speedbar)
(global-set-key (kbd "<f2>") 'sr-speedbar-toggle)

(require 'bs)
(setq bs-configurations
'(("files" "^\\*scratch\\*" nil nil bs-visits-non-file bs-sort-buffer-interns-are-last)))

(global-set-key (kbd "<f1>") 'bs-show)

>>>>>>> 58a6a76032836e82a5f72d1f889e91ce1b7b04ee
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes") 
(load-theme 'spolsky t)

;; Interactively Do Things (highly recommended, but not strictly required)
       (require 'ido)
       (ido-mode t)
<<<<<<< HEAD

=======
     
>>>>>>> 58a6a76032836e82a5f72d1f889e91ce1b7b04ee
       ;; Rinari
       (add-to-list 'load-path "~/.emacs.d/rinari")
       (require 'rinari)

;;; This was installed by package-install.el. ;;; Move this code earlier if you want to reference packages in your .emacs. (when (load (expand-file-name "~/.emacs.d/elpa/package.el")) (package-initialize)) 
<<<<<<< HEAD
;; use more repositories for elpa (setq package-archives '(("elpa" . "http://tromey.com/elpa/") ("gnu" . "http://elpa.gnu.org/packages/") ("marmalade" . "http://marmalade-repo.org/packages/")))

(require 'epa-file)
(epa-file-enable)
(setq epa-file-select-keys nil) 
=======

;; use more repositories for elpa (setq package-archives '(("elpa" . "http://tromey.com/elpa/") ("gnu" . "http://elpa.gnu.org/packages/") ("marmalade" . "http://marmalade-repo.org/packages/")))
>>>>>>> 58a6a76032836e82a5f72d1f889e91ce1b7b04ee
