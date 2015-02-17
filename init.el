;; ================================== Init =====================================

(defun my/initialize ()
  "Initialize all my configs files. p.s. equal `load-file' init.el"
  (interactive)
  (let ((conf.d "~/.emacs.d/conf.d/"))
    (setq custom-file (concat conf.d "custom.el"))
    (dolist (config-files
             (directory-files conf.d t "\.el$" nil))
      (load (file-name-sans-extension config-files) 'noerror))))

(my/initialize)

;; ========================= To be continued... ================================
