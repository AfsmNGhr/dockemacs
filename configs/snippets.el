;; ================================ Snippets  ==================================

(add-to-list 'load-path
              "~/.emacs.d/plugins/snippets/yasnippet")

(require 'yasnippet)
(yas-global-mode 1)
(add-to-list 'ac-sources 'ac-source-yasnippet)
;;(setq yas-snippet-dirs
;;        "~/.emacs.d/plugins/snippets/yasnippet/yasmate/snippets"
;;        "~/.emacs.d/plugins/snippets/yasnippet/snippets"))

;; ========================= To be continued... ================================
