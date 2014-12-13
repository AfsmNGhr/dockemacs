;; =============================== Ruby  =======================================

(add-to-list 'load-path "~/.emacs.d/plugins/ruby/robe")
(add-to-list 'load-path "~/.emacs.d/plugins/ruby")

(require 'rvm)
(rvm-use-default)

(require 'ruby-mode)
(require 'inf-ruby)
(require 'robe)
(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'robe-mode-hook 'ac-robe-setup)

(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
  (rvm-activate-corresponding-ruby))

;; ============================= Rsense ========================================

(setq rsense-home "$RSENSE_HOME")
(add-to-list 'load-path (concat rsense-home "/opt/rsense-0.3"))
(require 'rsense)
(add-hook 'ruby-mode-hook
          (lambda ()
            (add-to-list 'ac-sources 'ac-source-rsense-method)
            (add-to-list 'ac-sources 'ac-source-rsense-constant)))

;; ========================= To be continued... ================================
