;; ============================== Package ======================================

(defconst my/emacs-dir (concat (getenv "HOME") "/.emacs.d/"))

(require 'package)
(setq package-enable-at-startup nil
      package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/")))
(package-initialize)

;; ============================== Use-package ==================================

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(require 'diminish)
(require 'bind-key)

;; (use-package benchmark-init
  ;; :ensure t
  ;; :init (benchmark-init/activate))

;; ================================== init =====================================

(defun my/initialize ()
  "Initialize all my configs files. \n
   p.s. equal `load-file' init.el \n
   without `package' and `use-package'"
  (interactive)
  (let ((conf.d (concat my/emacs-dir "/conf.d/")))
    (setq custom-file (concat conf.d "custom.el"))
    (dolist (config-files
             (directory-files conf.d t "\.el$" nil))
      (load (file-name-sans-extension config-files) 'noerror))))

(my/initialize)

;; ========================= To be continued... ================================
