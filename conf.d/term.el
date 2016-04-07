;; ================================ Shell ======================================

(use-package multi-term :defer t :ensure t
  :config
  (setq multi-term-program "/bin/bash"
        comint-input-ring-file-name (getenv "HISTFILE"))
  (comint-read-input-ring t))

(use-package xclip :ensure t :defer 20
  :config (xclip-mode 1))

;; ========================= To be continued... ================================
