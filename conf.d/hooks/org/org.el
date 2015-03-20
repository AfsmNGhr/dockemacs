;; ============================== Org mode =====================================

(defvar *org-path* "~/.emacs.d/el-get/")
(add-to-list 'load-path (concat *org-path* "org-mode/contrib/lisp") t)

(require 'org)
(setq org-todo-keywords
      '((sequence "TODO" "INPROGRESS" "DONE"))
      org-todo-keyword-faces
      '(("INPROGRESS" . (:foreground "DodgerBlue2" :weight bold))))

(define-prefix-command 'org-todo-keys)
(define-key org-mode-map "\C-cx" 'org-todo-keys)
(define-key org-todo-keys "t"
  '(lambda () (interactive) (org-todo "TODO")))
(define-key org-todo-keys "d"
  '(lambda () (interactive) (org-todo "DONE")))
(define-key org-todo-keys "i"
  '(lambda () (interactive) (org-todo "INPROGRESS")))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((gnuplot . t)))

;; ================================= Scrum =====================================

(add-to-list 'load-path "~/.emacs.d/plugins/org")
(require 'scrum)

;; =============================== Gnuplot =====================================

(setq load-path (concat *org-path* "gnuplot-mode")
      auto-mode-alist (append '(("\\.gp$" . gnuplot-mode)) auto-mode-alist))
(autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
(autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot mode" t)

;; ========================= To be continued... ================================
