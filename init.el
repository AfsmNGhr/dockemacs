;; ================================== Init =====================================

(setq custom-file "~/.emacs.d/configs/custom.el")

(dolist (config-files
         (directory-files "~/.emacs.d/configs" t "\.el$" nil))
  (load (file-name-sans-extension config-files) 'noerror))

;; ========================= To be continued... ================================
