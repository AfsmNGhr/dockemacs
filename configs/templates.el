;; =========================== Templates...  ==================================

(add-to-list 'load-path "~/.emacs.d/plugins/templates")
(require 'slim-mode)

(add-to-list 'load-path "~/.emacs.d/plugins/templates/rhtml")
(require 'rhtml-mode)
(add-to-list 'auto-mode-alist '("\\.jst\\.eco$" . rhtml-mode))

;; ========================= To be continued... ================================
