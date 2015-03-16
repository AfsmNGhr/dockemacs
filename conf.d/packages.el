;; ================================= Packages ==================================

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; (defvar my-packages
;;   '(ergoemacs-mode))

;; (dolist (p my-packages)
;;   (when (not (package-installedp p))
;;     (package-install p)))

;; ============================== El-get =======================================

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
(setq el-get-recipe-path '("~/.emacs.d/el-get/el-get/recipes/"))
(setq el-get-sources '(robe flymake-ruby rvm rubocop rspec-mode))
(el-get 'sync)

;; ========================= To be continued... ================================
