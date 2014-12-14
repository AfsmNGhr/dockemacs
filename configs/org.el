;; =========================== Org mode ==================================

(add-to-list 'load-path "~/.emacs.d/plugins/org/org-mode/contrib/lisp" t)

(setq org-log-done t
      org-todo-keywords '((sequence "TODO" "INPROGRESS" "DONE"))
      org-todo-keyword-faces '(("INPROGRESS" .
                                (:foreground "DodgerBlue2" :weight bold))))
(add-hook 'org-mode-hook
          (lambda ()
            (flyspell-mode)))

;;(eval-after-load "org"
;; '(progn
;;    (define-prefix-command 'org-todo-state-map)
;;    (define-key org-mode-map "\C-cx" 'org-todo-state-map)
;;    (define-key org-todo-state-map "d"
;;      '(lambda nil (interactive) (org-todo "DONE")))
;;    (define-key org-todo-state-map "i"
;;      '(lambda nil (interactive) (org-todo "INPROGRESS")))))
