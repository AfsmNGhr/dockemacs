;; =========================== Templates...  ==================================

(add-to-list 'load-path "~/.emacs.d/plugins/templates")
(autoload 'slim-mode "slim" "slim major mode" t)

(add-to-list 'load-path "~/.emacs.d/plugins/templates/rhtml")
(autoload 'rhtml-mode "rhtml" "rhtml major mode" t)
(add-to-list 'auto-mode-alist '("\\.jst\\.eco$" . rhtml-mode))

;; ========================= To be continued... ================================
