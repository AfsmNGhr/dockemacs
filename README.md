### My emacs config [![Build Status](https://travis-ci.org/AfsmNGhr/emacs.svg)](https://travis-ci.org/AfsmNGhr/emacs)

### *Customize interface & [Themes](themes.md)

```.elisp

;; ================================== Theme ====================================

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(if (daemonp)
    (progn
      (load-theme 'spolsky-term t t)
  (load-theme 'spolsky t)))

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

(add-hook 'after-make-frame-functions 'my/enable-theme)

;; ================================== Time =====================================

(setq display-time-interval 1
      display-time-format "%H:%M")
(display-time-mode)

;; =============================== Delete bars =================================

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(column-number-mode -1)
(line-number-mode -1)
(size-indication-mode -1)
```

### *Packages*

```.elisp

;; ============================== Package ======================================

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; ============================== Use-package ==================================

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(setq use-package-verbose t
      load-prefer-newer t)

(require 'use-package)
(require 'diminish)
(require 'bind-key)
```

### *Keybinding*

```.elisp

(global-set-key (kbd "C-w") 'kill-buffer-and-window)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-2") 'quick-cut-line)
(global-set-key (kbd "M-3") 'quick-copy-line)
(global-set-key (kbd "<mouse-2>") 'x-clipboard-yank)

;; ======================== Reverse-input-method ===============================

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
                (define-key local-function-key-map
                  (vector (append mod (list from)))
                  (vector (append mod (list to)))))))))
      (when input-method
        (activate-input-method current))))

(defun is-interactive-frame-available ()
  (and (not noninteractive)
       (not (and (daemonp)
                 (null (cdr (frame-list)))
                 (eq (selected-frame) terminal-frame)))))

(defmacro* exec-after-interactive-frame-available
    ((&rest captures) &rest body)
  (declare (indent defun))
  `(if (is-interactive-frame-available)
       (progn ,@body)
     (lexical-let (,@(mapcar #'(lambda (c) (list c c)) captures))
       (add-hook 'after-make-frame-functions
                 #'(lambda (frame)
                     (with-selected-frame frame
                       ,@body))))))

(exec-after-interactive-frame-available ()
   (reverse-input-method "russian-computer")
   (setq read-passwd-map
         (let ((map read-passwd-map))
           (set-keymap-parent map minibuffer-local-map)
           (define-key map [return] #'exit-minibuffer)
           (define-key map [backspace] #'delete-backward-char)
           map)))
```

### *Features*

```.elisp

(use-package auto-complete
  :ensure t :defer t
  :init (global-auto-complete-mode))

(use-package yasnippet
  :ensure t :defer t
  :config (yas-global-mode 1))

(use-package flx-ido
  :ensure t
  :config
  (ido-mode 1)
  (ido-everywhere 1)
  (flx-ido-mode 1)
  (setq ido-enable-flex-matching t
        ido-use-faces t
        gc-cons-threshold 20000000))

(electric-pair-mode 1)

(use-package bookmark
  :config
  (setq bookmark-save-flag t)
  (global-set-key (kbd "C-x v") 'bookmark-set)
  (global-set-key (kbd "s-SPC") 'bookmark-save)
  (global-set-key (kbd "C-x r b")
    (lambda ()
      (interactive)
      (bookmark-jump
       (ido-completing-read "Jump to bookmark: " (bookmark-all-names))))))

(use-package smex
  :ensure t :defer t
  :config
  (smex-initialize)
  (smex-auto-update 600))

(use-package projectile
  :ensure t :defer t
  :diminish projectile-mode
  :init (projectile-global-mode)
  :config
  (setq-default projectile-enable-caching t
        projectile-indexing-method 'native))

(use-package perspective
  :ensure t :defer t
  :init
  (persp-mode))

(use-package multiple-cursors
  :ensure t :defer t
  :bind (("C-c C-S-c" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)
         ("s-SPC" . set-rectangular-region-anchor)))
```

### *Ruby*

```.elisp

(use-package bundler
  :ensure t :defer t)

(use-package rvm
  :ensure t :defer t
  :init (rvm-use-default))

(use-package rubocop
  :ensure t :defer t
  :init
  (add-hook 'ruby-mode-hook 'rubocop-mode))

(use-package robe
  :ensure t :defer t
  :init
  (progn (add-hook 'ruby-mode-hook 'robe-mode)
         (add-hook 'robe-mode-hook 'ac-robe-setup)
         (add-hook 'ruby-mode-hook 'auto-complete-mode)
         (add-hook 'ruby-mode-hook 'flycheck-mode)))

(use-package rhtml-mode
  :ensure t :defer t
  :mode
  (("\\.jst\\.eco$" . rhtml-mode)
   ("\\.html\\.erb$" . rhtml-mode)))

(use-package rspec-mode
  :ensure t :defer t
  :config
  (eval-after-load 'rspec-mode
    '(rspec-install-snippets)))
```

### *Hooks*

```.elisp

;; =========================== Compile elisp ===================================

(defun byte-compile-current-buffer ()
  "`byte-compile' current buffer if it's emacs-lisp-mode
   and compiled file exists."
  (interactive)
  (when (and (eq major-mode 'emacs-lisp-mode)
             (file-exists-p (byte-compile-dest-file buffer-file-name)))
    (byte-compile-file buffer-file-name)))

;; ================================ Hooks ======================================

(add-hook 'after-save-hook 'byte-compile-current-buffer)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

```

### *Benchmark*

```.clojure
Benchmark results

╼►[benchmark-init/root nil 2241ms]
  ├─[ido-completing-read+ require 7ms]
  ├─[quail/cyrillic load 8ms]
  ├─[/usr/share/emacs/24.5/lisp/term/xterm.elc load 4ms]
  ├─[default load 5ms]
  ├─[~/.emacs.d/conf.d/templates load 1ms]
  ├─[~/.emacs.d/conf.d/ruby load 1252ms]
  ├─[~/.emacs.d/conf.d/remote load 1ms]
  │ ╰─[tramp require 16ms]
  │   ╰─[tramp-compat require 4ms]
  │     ├─[tramp-loaddefs require 64ms]
  │     ├─[trampver require 2ms]
  │     ╰─[shell require 6ms]
  │       ╰─[pcomplete require 4ms]
  ├─[~/.emacs.d/conf.d/org load 0ms]
  ├─[~/.emacs.d/conf.d/lisp load 0ms]
  ├─[~/.emacs.d/conf.d/kbd load 1ms]
  ├─[~/.emacs.d/conf.d/js load 1ms]
  ├─[~/.emacs.d/conf.d/interface load 18ms]
  │ ╰─[filenotify require 2ms]
  ├─[~/.emacs.d/conf.d/hooks load 0ms]
  ├─[~/.emacs.d/conf.d/features load 148ms]
  │ ├─[compile require 7ms]
  │ │ ╰─[comint require 10ms]
  │ │   ├─[regexp-opt require 2ms]
  │ │   ╰─[ansi-color require 2ms]
  │ ├─[ibuf-ext require 4ms]
  │ ├─[ibuffer require 9ms]
  │ ├─[dash require 4ms]
  │ ├─[smex require 2ms]
  │ ├─[flx-ido require 3ms]
  │ │ ╰─[ido require 8ms]
  │ ├─[bookmark require 5ms]
  │ │ ╰─[pp require 3ms]
  │ ├─[icicles-mode require 44ms]
  │ ├─[icicles-cmd2 require 50ms]
  │ ├─[icicles-cmd1 require 139ms]
  │ ├─[icicles-mcmd require 36ms]
  │ │ ├─[help-mode require 3ms]
  │ │ ╰─[image-dired require 19ms]
  │ │   ├─[format-spec require 2ms]
  │ │   ╰─[dired require 7ms]
  │ ├─[icicles-fn require 42ms]
  │ │ ╰─[flx require 1ms]
  │ ├─[icicles-var require 5ms]
  │ ├─[icicles-opt require 70ms]
  │ │ ├─[ffap require 15ms]
  │ │ │ ╰─[url-parse require 14ms]
  │ │ │   ├─[auth-source require 4ms]
  │ │ │   │ ├─[eieio require 8ms]
  │ │ │   │ │ ╰─[eieio-core require 5ms]
  │ │ │   │ ├─[gnus-util require 16ms]
  │ │ │   │ ├─[mm-util require 11ms]
  │ │ │   │ │ ╰─[mail-prsvr require 2ms]
  │ │ │   │ ╰─[password-cache require 2ms]
  │ │ │   ╰─[url-vars require 2ms]
  │ │ ├─[cus-theme require 3ms]
  │ │ │ ╰─[cus-edit require 21ms]
  │ │ ╰─[thingatpt require 2ms]
  │ ├─[icicles-face require 3ms]
  │ ├─[etags require 4ms]
  │ │ ╰─[ring require 2ms]
  │ ├─[company-dabbrev require 1ms]
  │ ├─[company-capf require 1ms]
  │ ├─[company-cmake require 1ms]
  │ ├─[company-clang require 1ms]
  │ ├─[company-eclim require 1ms]
  │ │ ╰─[company-template require 10ms]
  │ ├─[kmacro require 3ms]
  │ ├─[pcase require 3ms]
  │ ├─[ace-jump-mode require 2ms]
  │ │ ╰─[cl require 3ms]
  │ │   ╰─[gv require 4ms]
  │ ╰─[keyfreq require 1ms]
  ├─[~/.emacs.d/conf.d/defuns load 0ms]
  ├─[~/.emacs.d/conf.d/custom load 2ms]
  │ ├─[~/.emacs.d/recentf load 9ms]
  │ ├─[recentf load 5ms]
  │ │ ╰─[tree-widget require 3ms]
  │ │   ╰─[wid-edit require 4ms]
  │ ├─[whitespace load 13ms]
  │ ├─[cus-start require 3ms]
  │ ╰─[cus-load require 32ms]
  ╰─[~/.emacs.d/conf.d/aliases load 0ms]

```

### *To be continued...*
