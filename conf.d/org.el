;; ============================== Org mode =====================================

(use-package org
  :defer t
  :config
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
    '(lambda () (interactive) (org-todo "INPROGRESS"))))

;; ========================= To be continued... ================================
