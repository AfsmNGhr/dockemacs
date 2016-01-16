;; ================================ Shell ======================================

(use-package shell :defer t
  :config
  (setq explicit-shell-file-name "/bin/bash")
  (autoload 'bash-completion-dynamic-complete
    "bash-completion"
    "BASH completion hook")
  (add-hook 'shell-dynamic-complete-functions
            'bash-completion-dynamic-complete)
  (add-hook 'shell-command-complete-functions
              'bash-completion-dynamic-complete))

;; ========================= To be continued... ================================
