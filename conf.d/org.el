;; ============================== Org mode =====================================

(use-package org-pomodoro
  :defer t)

(use-package org
  :defer t
  :config
  (setq org-todo-keywords
      '((sequence "TODO" "INPROGRESS" "DONE" "CANCELED"))
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
  (define-key org-todo-keys "c"
    '(lambda () (interactive) (org-todo "CANCELED")))

;; ============================ Org agenda =====================================

  (define-key global-map "\C-cl" 'org-store-link)
  (define-key global-map "\C-ca" 'org-agenda)
  (setq org-log-done t
        org-agenda-files (directory-files "~/Documents/org/" t "\.org$" nil)))

;; ========================= To be continued... ================================
