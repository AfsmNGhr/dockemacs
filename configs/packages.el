;; ================================= Package ===================================

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

;; ============================== El-get =======================================

;; (add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;; (unless (require 'el-get nil 'noerror)
;;   (with-current-buffer
;;       (url-retrieve-synchronously
;;        "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
;;     (goto-char (point-max))
;;     (eval-print-last-sexp)))
;; (setq el-get-byte-compile nil)
;; (setq el-get-recipe-path '("~/.emacs.d/el-get/recipes/"))
;; (setq el-get-sources '())
;; (el-get 'sync)

;; ========================= To be continued... ================================
