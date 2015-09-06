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
    '(lambda () (interactive) (org-todo "INPROGRESS")))

;; ============================ Org agenda =====================================

  (define-key global-map "\C-cl" 'org-store-link)
  (define-key global-map "\C-ca" 'org-agenda)
  (setq org-log-done t
        org-agenda-files (directory-files "~/Documents/org/" t "\.org$" nil)))

;; ========================= To be continued... ================================
