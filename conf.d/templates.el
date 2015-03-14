;; =========================== Templates...  ==================================

(add-to-list 'load-path "~/.emacs.d/plugins/templates")
(require 'slim-mode)

(add-to-list 'load-path "~/.emacs.d/plugins/templates/rhtml")
(require 'rhtml-mode)
(add-to-list 'auto-mode-alist '("\\.jst\\.eco$" . rhtml-mode))

(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.js.coffee$" . js-mode))

(add-to-list 'load-path "~/.emacs.d/plugins/templates/yaml-mode")
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook 'yaml-mode-hook
      '(lambda ()
        (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; ========================= To be continued... ================================
