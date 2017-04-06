;; ================================ Shell ======================================

(use-package multi-term :defer t :ensure t
  :config
  (setq multi-term-program "/bin/bash"
        comint-input-ring-file-name (getenv "HISTFILE"))
  (comint-read-input-ring t))

;; Do not use gpg agent when runing in terminal
(defadvice epg--start (around advice-epg-disable-agent activate)
  (let ((agent (getenv "GPG_AGENT_INFO")))
    (when (not (display-graphic-p))
      (setenv "GPG_AGENT_INFO" nil))
    ad-do-it
    (when (not (display-graphic-p))
      (setenv "GPG_AGENT_INFO" agent))))

;; ========================= To be continued... ================================
