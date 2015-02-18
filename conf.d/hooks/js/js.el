;; ================================== JS =======================================

(defvar js-path "~/.emacs.d/plugins/js/")

(add-to-list 'load-path (concat js-path "js2-mode"))
(require 'js2-mode)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)
(setq js2-highlight-level 3)

(add-to-list 'load-path (concat js-path "ac-js2"))
(add-hook 'js2-mode-hook 'ac-js2-mode)

(add-to-list 'load-path (concat js-path "js3-mode"))
(require 'js3-mode)

;; ================================ Coffee =====================================

(add-to-list 'load-path (concat js-path "coffee-mode"))

(require 'coffee-mode)

(add-to-list 'auto-mode-alist
            '("\\.coffee$" . rinari-minor-mode)
            '("\\.coffee$" . coffee-mode))

(eval-after-load "coffee-mode"
 '(progn
    (define-key coffee-mode-map [(meta r)] 'coffee-compile-buffer)
    (define-key coffee-mode-map (kbd "C-j") 'coffee-newline-and-indent)))

(add-to-list 'load-path (concat js-path "ac-coffee"))

(require 'ac-coffee)

;; ================================= Tern ======================================

(add-to-list 'load-path (concat js-path "tern/emacs"))

(require 'tern)

(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))

;; =============================== Comint ======================================

(add-to-list 'load-path (concat js-path "js-comint"))

(require 'js-comint)
(setq inferior-js-program-command "nodejs")
(setenv "NODE_NO_READLINE" "1")

;; ============================ Revert-buffer ==================================

(revert-buffer t t nil)

;; ========================= To be continued... ================================
