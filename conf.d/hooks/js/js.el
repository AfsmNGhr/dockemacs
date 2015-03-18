;; ================================== JS =======================================

(defvar js-path "~/.emacs.d/plugins/js/")

(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)

;; ============================ Coffee-mode ====================================

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

(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (tern-ac-setup)))

;; ============================== Js-comint ====================================

(setq inferior-js-program-command "nodejs")
(setenv "NODE_NO_READLINE" "1")

;; ========================= To be continued... ================================
