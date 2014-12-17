;; =========================== Org mode ==================================

(add-to-list 'load-path "~/.emacs.d/plugins/org/org-mode/contrib/lisp" t)

(setq org-log-done t
      org-todo-keywords '((sequence "TODO" "INPROGRESS" "DONE"))
      org-todo-keyword-faces '(("INPROGRESS" .
                                (:foreground "DodgerBlue2" :weight bold))))
(add-hook 'org-mode-hook
          (lambda ()
            (flyspell-mode)))

(eval-after-load "org"
'(progn
   (define-prefix-command 'org-todo-map)
   (define-key org-mode-map "\C-cx" 'org-todo-map)
   (define-key org-todo-map "d"
     '(lambda nil (interactive) (org-todo "DONE")))
   (define-key org-todo-map "i"
     '(lambda nil (interactive) (org-todo "INPROGRESS")))))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((gnuplot . t)))

(add-to-list 'load-path "~/.emacs.d/plugins/org")
(require 'scrum)

(setq load-path (append (list "~/.emacs.d/plugins/org/gnuplot-mode") load-path))
(require 'gnuplot)
(autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
(autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot mode" t)
(setq auto-mode-alist (append '(("\\.gp$" . gnuplot-mode)) auto-mode-alist))

;; ========================= To be continued... ================================
