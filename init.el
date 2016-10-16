;; ============================== Package ======================================

(defconst my/emacs-dir (concat (getenv "HOME") "/.emacs.d/"))

(setq package-enable-at-startup nil
      load-prefer-newer t
      package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/")))

(unless (version< emacs-version "25.1")
  (setq package-archive-priorities '(("melpa-stable" . 20)
                                     ("marmalade" . 20)
                                     ("gnu" . 10)
                                     ("melpa" . 0))))

(unless (fboundp 'package-initialize)
  (require 'package))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; ============================== Use-package ==================================

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(require 'diminish)
(require 'bind-key)

;; =============================== Benchmark ===================================

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
