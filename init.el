;; ============================= Benchmark =====================================

(let ((benchmark-init.el "~/.emacs.d/el-get/benchmark-init/benchmark-init.el"))
  (when (file-exists-p benchmark-init.el)
    (load benchmark-init.el)))
(benchmark-init/activate)

;; ================================== Init =====================================

(defun my/initialize ()
  "Initialize all my configs files. \n
   p.s. equal `load-file' init.el without benchmark"
  (interactive)
  (let ((conf.d "~/.emacs.d/conf.d/"))
    (setq custom-file (concat conf.d "custom.el"))
    (dolist (config-files
             (directory-files conf.d t "\.el$" nil))
      (load (file-name-sans-extension config-files) 'noerror))))

(my/initialize)

;; ========================= To be continued... ================================
