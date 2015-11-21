;; ============================== Package ======================================

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; ============================== Use-package ==================================

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(setq use-package-verbose t)

(require 'use-package)
(require 'diminish)
(require 'bind-key)

(use-package benchmark-init
  :ensure t
  :init (benchmark-init/activate))

;; ================================== init =====================================

(defun my/initialize ()
  "Initialize all my configs files. \n
   p.s. equal `load-file' init.el \n
   without `package' and `use-package'"
  (interactive)
  (let ((conf.d "~/.emacs.d/conf.d/"))
    (setq custom-file (concat conf.d "custom.el"))
    (dolist (config-files
             (directory-files conf.d t "\.el$" nil))
      (load (file-name-sans-extension config-files) 'noerror))))

(my/initialize)

;; ========================= To be continued... ================================
