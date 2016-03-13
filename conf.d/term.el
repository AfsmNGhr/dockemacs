;; ================================ Shell ======================================

(use-package shell :defer t
    :config
    (setq explicit-shell-file-name "/bin/bash"
          comint-input-ring-file-name (getenv "HISTFILE"))
    (comint-read-input-ring t))

;; ========================= To be continued... ================================
