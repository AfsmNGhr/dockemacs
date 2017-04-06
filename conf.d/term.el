;; ================================ Shell ======================================

(use-package multi-term :defer t :ensure t
  :config
  (setq multi-term-program "/bin/sh"
        comint-input-ring-file-name (getenv "HISTFILE"))
  (comint-read-input-ring t))

;; ========================= To be continued... ================================
