;; ================================== JS =======================================

(add-to-list 'load-path "~/.emacs.d/plugins/js/js2-mode")
(require 'js2-mode)
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)
(setq js2-highlight-level 3)

(add-to-list 'load-path "~/.emacs.d/plugins/js/ac-js2")
(add-hook 'js2-mode-hook 'ac-js2-mode)

;; ================================ Coffee =====================================

(add-to-list 'load-path "~/.emacs.d/plugins/js")
(require 'coffee-mode)
(add-to-list 'auto-mode-alist
            '("\\.coffee$" . rinari-minor-mode)
            '("\\.coffee$" . coffee-mode))

(eval-after-load "coffee-mode"
 '(progn
    (define-key coffee-mode-map [(meta r)] 'coffee-compile-buffer)
    (define-key coffee-mode-map (kbd "C-j") 'coffee-newline-and-indent)))

(add-to-list 'load-path "~/.emacs.d/plugins/js/ac-coffee")
(require 'ac-coffee)

;; ============================ Revert-buffer ==================================

(revert-buffer t t nil)

;; ========================= To be continued... ================================
