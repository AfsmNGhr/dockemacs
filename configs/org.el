;; ============================== Org mode =====================================

(add-to-list 'load-path "~/.emacs.d/plugins/org/org-mode/contrib/lisp" t)
(add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))

(setq org-log-done t
      org-todo-keywords
      '((sequence "TODO" "INPROGRESS" "DONE"))
      org-todo-keyword-faces
      '(("INPROGRESS" . (:foreground "DodgerBlue2" :weight bold))))

(add-hook 'org-mode-hook
          (lambda ()
            (flyspell-mode)))

(eval-after-load "org"
  '(progn
     (define-prefix-command 'org-todo-keys)
     (define-key org-mode-map "\C-cx" 'org-todo-keys)
     (define-key org-todo-keys "t"
       '(lambda nil (interactive) (org-todo "TODO")))
     (define-key org-todo-keys "d"
       '(lambda nil (interactive) (org-todo "DONE")))
     (define-key org-todo-keys "i"
       '(lambda nil (interactive) (org-todo "INPROGRESS")))))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((gnuplot . t)))

;; ================================= Scrum =====================================

(add-to-list 'load-path "~/.emacs.d/plugins/org")
(autoload 'scrum-update-all "org" "org major mode" t)

;; =============================== Gnuplot =====================================

(setq load-path (append (list "~/.emacs.d/plugins/org/gnuplot-mode") load-path))
(autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
(autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot mode" t)
(setq auto-mode-alist (append '(("\\.gp$" . gnuplot-mode)) auto-mode-alist))

;; ========================= To be continued... ================================
