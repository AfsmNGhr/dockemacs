;; =========================== Interface  ==================================

(add-to-list 'load-path "~/.emacs.d/")

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
 '(delete-selection-mode t)
 '(ergoemacs-ctl-c-or-ctl-x-delay 0.2)
 '(ergoemacs-handle-ctl-c-or-ctl-x (quote both))
 '(ergoemacs-keyboard-layout "us")
 '(ergoemacs-smart-paste nil)
 '(ergoemacs-use-menus t)
 '(global-whitespace-mode t)
 '(gnutls-min-prime-bits 1024)
 '(initial-buffer-choice t)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(org-CUA-compatible nil)
 '(shift-select-mode nil)
 '(smex-prompt-string "[Alt+A]")
 '(whitespace-style (quote (face lines-tail))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(whitespace-empty ((t (:background "VioletRed1" :foreground "DeepPink4")))))

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

;; =========================== Remote ==================================

(require 'tramp)
(setq-default tramp-persistency-file-name nil)
(setq-default tramp-default-method "sshx")
(tramp-set-completion-function "ssh"
                               '((tramp-parse-sconfig "/etc/ssh_config")
                                 (tramp-parse-sconfig "~/.ssh/config")))
(tramp-parse-shostkeys "/etc/ssh2/hostkeys/*")
(tramp-parse-shostkeys "~/.ssh2/hostkeys/*")

;; =========================== Browser ==================================

(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "firefox-nightly")
(global-set-key (kbd "C-x g") 'ergoemacs-lookup-google) 

;; =========================== Org mode  ==================================

(add-to-list 'load-path "~/.emacs.d/org-mode/contrib/lisp" t)
(setq org-todo-keywords
'((sequence "TODO" "|" "DONE" "|" "FEEDBACK" "VERIFY" "FREEZING" )))

;; =========================== GPG ... ==================================

(require 'epa-file)
(epa-file-enable)
(setq epa-file-cache-passphrase-for-symmetric-encryption t)

;; =========================== Features  ==================================

(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(setq ac-auto-show-menu 0.5)
(setq ac-menu-height 20)
(global-auto-complete-mode 1)

(require 'linum+)
(setq linum-format "%d ")
(global-linum-mode 1)

(require 'ido-hacks)
(ido-mode t)
(setq ido-enable-flex-matching t)

;; (add-to-list 'load-path "~/emacs.d/flx")
;; (require 'flx-ido)
;; (ido-mode 1)
;; (ido-everywhere 1)
;; (flx-ido-mode 1)
;; ;; disable ido faces to see flx highlights.
;; (setq ido-use-faces nil)

(add-to-list 'load-path "~/.emacs.d/multiple-cursors")
(require 'multiple-cursors)
(global-set-key (kbd "C-x C-m") 'mc/edit-lines)
(global-set-key (kbd "C-.") 'mc/mark-next-like-this)
(global-set-key (kbd "C-,") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-,") 'mc/mark-all-like-this)

(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers

;; =========================== Sudo  ======================================

(defun sudo-before-save-hook ()
  (set (make-local-variable 'sudo:file) (buffer-file-name))
  (when sudo:file
    (unless(file-writable-p sudo:file)
      (set (make-local-variable 'sudo:old-owner-uid) (nth 2 (file-attributes sudo:file)))
      (when (numberp sudo:old-owner-uid)
	(unless (= (user-uid) sudo:old-owner-uid)
	  (when (y-or-n-p
		 (format "File %s is owned by %s, save it with sudo? "
			 (file-name-nondirectory sudo:file)
			 (user-login-name sudo:old-owner-uid)))
	    (sudo-chown-file (int-to-string (user-uid)) (sudo-quoting sudo:file))
	    (add-hook 'after-save-hook
		      (lambda ()
			(sudo-chown-file (int-to-string sudo:old-owner-uid)
					 (sudo-quoting sudo:file))
			(if sudo-clear-password-always
			    (sudo-kill-password-timeout)))
		      nil   ;; not append
		      t	    ;; buffer local hook
		      )))))))

(add-hook 'before-save-hook 'sudo-before-save-hook)

(defun sudo-edit (&optional arg)
  "Edit currently visited file as root.

With a prefix ARG prompt for a file to visit.
Will also prompt for a file to visit if current
buffer is not visiting a file."
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:"
                         (ido-read-file-name "Find file(as root): ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))


(defadvice ido-find-file (after find-file-sudo activate)
  "Find file as root if necessary."
  (unless (and buffer-file-name
               (file-writable-p buffer-file-name))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(global-set-key (kbd "C-x w") 'sudo-edit)

;; =========================== Commands  ==================================

(require 'smex)

;; =========================== Keybinding  ==================================

(add-to-list 'load-path "~/.emacs.d/ergoemacs-mode")
(require 'ergoemacs-mode)

(setq ergoemacs-theme nil) ;; Uses Standard Ergoemacs keyboard theme
(setq ergoemacs-keyboard-layout "us") ;; Assumes QWERTY keyboard layout
(ergoemacs-mode 1)

(defun reverse-input-method (input-method)
  "Build the reverse mapping of single letters from INPUT-METHOD."
  (interactive
   (list (read-input-method-name "Use input method (default current): ")))
  (if (and input-method (symbolp input-method))
      (setq input-method (symbol-name input-method)))
  (let ((current current-input-method)
        (modifiers '(nil (control) (meta) (control meta))))
    (when input-method
      (activate-input-method input-method))
    (when (and current-input-method quail-keyboard-layout)
      (dolist (map (cdr (quail-map)))
        (let* ((to (car map))
               (from (quail-get-translation
                      (cadr map) (char-to-string to) 1)))
          (when (and (characterp from) (characterp to))
            (dolist (mod modifiers)
              (define-key (if mod input-decode-map local-function-key-map)
                (vector (append mod (list from)))
                (vector (append mod (list to)))))))))
    (when input-method
      (activate-input-method current))))


(defadvice read-passwd (around my-read-passwd act)
  (let ((local-function-key-map nil))
    ad-do-it))

(reverse-input-method 'russian-computer)

;; =========================== Bookmark  ==================================

(global-set-key (kbd "`")         'bookmark-jump)
(global-set-key (kbd "C-x v")         'bookmark-set)
(global-set-key (kbd "s-SPC")         'bookmark-save)

;; =========================== Snippets  ==================================

(add-to-list 'load-path
              "~/.emacs.d/yasnippet")

(require 'yasnippet)
(yas-global-mode 1)

(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"                 ;; personal snippets
        "~/.emacs.d/some/collection/"           ;; foo-mode and bar-mode snippet collection
        "~/.emacs.d/yasnippet/yasmate/snippets" ;; the yasmate collection
        "~/.emacs.d/yasnippet/snippets"))

;; =========================== Packages  ==================================

;; (require 'package)
;; (add-to-list 'package-archives
;;              '("marmalade" . "http://marmalade-repo.org/packages/") t)
;; (package-initialize)

;; (add-to-list 'load-path "~/.emacs.d/el-get")

;; (unless (require 'el-get nil 'noerror)
;;   (with-current-buffer
;;       (url-retrieve-synchronously
;;        "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
;;     (goto-char (point-max))
;;     (eval-print-last-sexp)))

;; (add-to-list 'el-get-recipe-path "~/.emacs.d/el-get/recipes")
;; (el-get 'sync)

;; =========================== Rails  ==================================

(require 'rvm)
(rvm-use-default)

(add-to-list 'load-path "~/.emacs.d/enhanced-ruby-mode")
(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))

(setq enh-ruby-program "~/.rvm/rubies/ruby-1.9.3-p547/bin/ruby")

;; =========================== Ruby  ====================================

;; (require 'flymake)

;; ;; I don't like the default colors :)
;; (set-face-background 'flymake-errline "red4")
;; (set-face-background 'flymake-warnline "dark slate blue")

;; ;; Invoke ruby with '-c' to get syntax checking
;; (defun flymake-ruby-init ()
;;   (let* ((temp-file   (flymake-init-create-temp-buffer-copy
;;                        'flymake-create-temp-inplace))
;; 	 (local-file  (file-relative-name
;;                        temp-file
;;                        (file-name-directory buffer-file-name))))
;;     (list "ruby" (list "-c" local-file))))

;; (push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
;; (push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)

;; (push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)

;; (add-hook 'ruby-mode-hook
;;           '(lambda ()

;; 	     ;; Don't want flymake mode for ruby regions in rhtml files and also on read only files
;; 	     (if (and (not (null buffer-file-name)) (file-writable-p buffer-file-name))
;; 		 (flymake-mode))
;; 	     ))

;; (add-hook 'web-mode-hook
;;           (lambda () (flyspell-prog-mode)))
;; ;; flyspell mode breaks auto-complete mode without this.
;; (ac-flyspell-workaround)

(require 'flyspell)
(setq flyspell-issue-message-flg nil)
(add-hook 'enh-ruby-mode-hook
          (lambda () (flyspell-prog-mode)))

(add-hook 'ruby-mode-hook 'projectile-mode)
(setq projectile-enable-caching t)

(setq-default ispell-program-name "aspell")
(setq ispell-local-dictionary "russian")
(global-flyspell-mode)

(require-package 'ruby-mode)
(require-package 'ruby-hash-syntax)
(add-auto-mode 'ruby-mode
               "Rakefile\\'" "\\.rake\\'" "\\.rxml\\'"
               "\\.rjs\\'" "\\.irbrc\\'" "\\.pryrc\\'" "\\.builder\\'" "\\.ru\\'"
               "\\.gemspec\\'" "Gemfile\\'")

;; (add-to-list 'load-path "~/.emacs.d/robe")
;; (require-package 'robe)
;; ; для работы с rvm
;; (defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
;;    (rvm-activate-corresponding-ruby))

;; (after-load 'ruby-mode
;;   (add-hook 'ruby-mode-hook 'robe-mode))
;; (after-load 'robe
;;   (add-hook 'robe-mode-hook 'ac-robe-setup))
;;   (add-hook 'robe-mode-hook
;;             (lambda ()
;;               (add-to-list 'ac-sources 'ac-source-robe)
;;               (set-auto-complete-as-completion-at-point-function)))

;; (setq rsense-home "$RSENSE_HOME")
;; (add-to-list 'load-path (concat rsense-home "/etc"))
;; (require 'rsense)

;; (add-hook 'ruby-mode-hook
;;           (lambda ()
;;             (local-set-key (kbd "C-c c") 'ac-complete-rsense)))

;; (add-hook 'ruby-mode-hook
;;          (lambda ()
;;            (add-to-list 'ac-sources 'ac-source-rsense-method)
;;            (add-to-list 'ac-sources 'ac-source-rsense-constant)))

;; =========================== Rinary  ==================================

;; Interactively Do Things (highly recommended, but not strictly required)
(require 'ido)
(ido-mode t)

(add-to-list 'load-path "~/.emacs.d/rinari")
(require 'rinari)
(global-rinari-mode)

(setf
 my-rinari-jump-schema
 '((my-stylesheet "y" ((t . "app/assets/stylesheets/.*")) nil)
   (my-javascript "j" ((t . "app/assets/javascripts/.*")) nil)
   (my-spine-application "a" ((t . "app/assets/javascripts/app/.*\\.js\\.coffee")) nil)
   (my-spine-lib "l" ((t . "app/assets/javascripts/app/lib/.*")) nil)
   (my-spine-model "m" ((t . "app/assets/javascripts/app/models/.*")) nil)
   (my-spine-view "v" ((t . "app/assets/javascripts/app/views/.*")) nil)
   (my-soine-index "r" ((t . "app/assets/javascripts/app/.*")) nil)

(my-fabrication "f" ((t . "spec/fabricators/.*")) nil)
   (my-rspec
    "t"
    (("app/models/\\1.rb"                      . "spec/models/\\1_spec.rb")
     ("app/controllers/\\1.rb"                 . "spec/controllers/\\1_spec.rb")
     ("app/views/\\1\\..*"                     . "spec/views/\\1_spec.rb")
     ("lib/\\1.rb"                             . "spec/libs/\\1_spec.rb")
     ("db/migrate/.*_create_\\1.rb"            . "spec/models/\\1_spec.rb")
     ("config/routes.rb"                       . "spec/routing/.*\\.rb")
     (t                                        . "spec/.*\\.rb"))
    t)

(my-decorator
    "d"
    (("app/models/\\1.rb"                      . "app/decorators/\\1_decorator.rb")
     ("app/controllers/\\1.rb"                 . "app/decorators/\\1_decorator.rb")
     ("app/views/\\1\\..*"                     . "app/decorators/\\1_decorator.rb")
     ("db/migrate/.*_create_\\1.rb"            . "app/decorators/\\1_decorator.rb")
     (t                                        . "app/decorators/.*\\.rb"))
    t)

   (my-request-rspec "r" ((t . "spec/requests/.*")) nil)
))

(rinari-apply-jump-schema my-rinari-jump-schema)

(define-key rinari-minor-mode-map (kbd "C-c m") 'rinari-find-model)
(define-key rinari-minor-mode-map (kbd "C-c M") 'rinari-find-mailer)
(define-key rinari-minor-mode-map (kbd "C-c c") 'rinari-find-controller)
(define-key rinari-minor-mode-map (kbd "C-c o") 'rinari-find-configuration)
(define-key rinari-minor-mode-map (kbd "C-c a") 'rinari-find-application)
(define-key rinari-minor-mode-map (kbd "C-c e") 'rinari-find-environment)
(define-key rinari-minor-mode-map (kbd "C-c h") 'rinari-find-helper)
(define-key rinari-minor-mode-map (kbd "C-c v") 'rinari-find-view)
(define-key rinari-minor-mode-map (kbd "C-c i") 'rinari-find-migration)
(define-key rinari-minor-mode-map (kbd "C-c l") 'rinari-find-lib)
(define-key rinari-minor-mode-map (kbd "C-c r") 'rinari-find-my-request-rspec)
(define-key rinari-minor-mode-map (kbd "C-c t") 'rinari-find-my-rspec)
(define-key rinari-minor-mode-map (kbd "C-c f") 'rinari-find-my-fabrication)
(define-key rinari-minor-mode-map (kbd "C-c y") 'rinari-find-my-stylesheet)
(define-key rinari-minor-mode-map (kbd "C-c d") 'rinari-find-my-decorator)
(define-key rinari-minor-mode-map (kbd "C-c j") 'rinari-find-my-javascript)
(define-key rinari-minor-mode-map (kbd "C-c C-c a") 'rinari-find-my-spine-application)
(define-key rinari-minor-mode-map (kbd "C-c C-c m") 'rinari-find-my-spine-model)
(define-key rinari-minor-mode-map (kbd "C-c C-c r") 'rinari-find-my-spine-index)
(define-key rinari-minor-mode-map (kbd "C-c C-c v") 'rinari-find-my-spine-view)
(define-key rinari-minor-mode-map (kbd "C-c C-c l") 'rinari-find-my-spine-lib)
(define-key rinari-minor-mode-map (kbd "C-l x") 'rinari-extract-partial)
(define-key rinari-minor-mode-map (kbd "C-l c") 'rinari-console)
(define-key rinari-minor-mode-map (kbd "C-l s") 'rinari-web-server)
(define-key rinari-minor-mode-map (kbd "C-l r") 'rinari-web-server-restart)
(define-key rinari-minor-mode-map (kbd "C-l p") 'rinari-cap)

(defun my-find-gemfile ()
  (interactive)
  (find-file (concat (rinari-root) "Gemfile")))
(define-key rinari-minor-mode-map (kbd "C-c g") 'my-find-gemfile)

;; =========================== Templates...  ==================================

(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(require 'css-mode)
(require 'sass-mode)

(require 'rainbow-mode)
(global-rainbow-mode)

(require 'slim-mode)

(require 'coffee-mode)
(add-to-list 'auto-mode-alist
            '("\\.coffee$" . rinari-minor-mode)
            '("\\.coffee$" . coffee-mode))

(eval-after-load "coffee-mode"
 '(progn
    (define-key coffee-mode-map [(meta r)] 'coffee-compile-buffer)
    (define-key coffee-mode-map (kbd "C-j") 'coffee-newline-and-indent)))

(add-to-list 'load-path "~/.emacs.d/rhtml")
(require 'rhtml-mode)
(add-to-list 'auto-mode-alist '("\\.jst\\.eco$" . rhtml-mode))

;; ====================== To be continued... ==========================
