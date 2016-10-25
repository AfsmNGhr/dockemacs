;; ================================ Shell ======================================

(use-package multi-term :defer t :ensure t
  :config
  (setq multi-term-program "/bin/bash"
        comint-input-ring-file-name (getenv "HISTFILE"))
  (comint-read-input-ring t))

;; (unless (display-graphic-p)
;;   (use-package xclip :ensure t
;;     :config (xclip-mode 1)))

;; ========================= To be continued... ================================
