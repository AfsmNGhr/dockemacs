;; =========================== Packages  ==================================

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

 (add-to-list 'load-path "~/.emacs.d/el-get")

 (unless (require 'el-get nil 'noerror)
   (with-current-buffer
       (url-retrieve-synchronously
        "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
     (goto-char (point-max))
     (eval-print-last-sexp)))

 (add-to-list 'el-get-recipe-path "~/.emacs.d/el-get/recipes")
 (el-get 'sync)

;; ====================== To be continued... ==========================
