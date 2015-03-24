;; =============================== Slime =======================================

(add-to-list 'load-path "~/.emacs.d/el-get/slime")
(add-to-list 'load-path "~/.emacs.d/el-get/slime/contrib")

(setq slime-backend "~/.emacs.d/el-get/slime/swank-loader.lisp")
(load "slime-autoloads")

(require 'slime)
(require 'slime-autoloads)

(eval-after-load "slime"
  `(progn
     (slime-setup '(slime-repl))
     (custom-set-variables
      '(inhibit-splash-screen t)
      '(slime-complete-symbol*-fancy t)
      '(slime-complete-symbol-function 'slime-fuzzy-complete-symbol)
      '(slime-net-coding-system 'utf-8-unix)
      '(slime-startup-animation nil)
      '(slime-lisp-implementations '((sbcl ("/usr/bin/sbcl")))))))

;; ========================= To be continued... ================================
