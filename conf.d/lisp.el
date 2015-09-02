;; =============================== Slime =======================================

(use-package slime
  :ensure t :defer t
  :config
  (eval-after-load "slime"
    `(progn
       (slime-setup '(slime-repl))
       (custom-set-variables
        '(inhibit-splash-screen t)
        '(slime-complete-symbol*-fancy t)
        '(slime-complete-symbol-function 'slime-fuzzy-complete-symbol)
        '(slime-net-coding-system 'utf-8-unix)
        '(slime-startup-animation nil)
        '(slime-lisp-implementations '((sbcl ("/usr/bin/sbcl"))))))))

;; ========================= To be continued... ================================
