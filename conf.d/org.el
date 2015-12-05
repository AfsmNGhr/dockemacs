;; ============================== Org mode =====================================

(use-package org-pomodoro :ensure t :defer t)

(use-package org :defer t
  :config
  (setq org-log-done t
        org-startup-indented t
        org-todo-keywords
        '((sequence "TODO" "INPROGRESS" "HOLD" "DONE" "CANCELLED"))
        org-todo-keyword-faces
        '(("INPORGRESS" . (:foreground "DodgerBlue2" :weight bold))))
  (define-prefix-command 'org-todo-keys)
  (define-key org-mode-map "\C-cx" 'org-todo-keys)
  (define-key org-todo-keys "t"
    '(lambda () (interactive) (org-todo "TODO")))
  (define-key org-todo-keys "n"
    '(lambda () (interactive) (org-todo "NEXT")))
  (define-key org-todo-keys "h"
    '(lambda () (interactive) (org-todo "HOLD")))
  (define-key org-todo-keys "d"
    '(lambda () (interactive) (org-todo "DONE")))
  (define-key org-todo-keys "i"
    '(lambda () (interactive) (org-todo "INPROGRESS")))
  (define-key org-todo-keys "c"
    '(lambda () (interactive) (org-todo "CANCELED")))

;; ============================ Org agenda =====================================

  (define-key global-map "\C-cl" 'org-store-link)
  (define-key global-map "\C-ca" 'org-agenda)
  (define-key global-map "\C-cc" 'org-capture)
  (setq org-agenda-files (directory-files "~/Documents/org/" t "\.org$" nil)
        org-capture-templates
        '(("t" "Tasks" entry (file "~/Documents/org/tasks.org")
           "* TODO %?\n  SCHEDULED: %^t")
          ("d" "Diary" entry (file+datetree "~/Documents/org/diary.org")
           "* %?")
          ("h" "Hopox" entry (file+datetree "~/Documents/org/hopox.org")
           "* TODO %? :WORK: ")
          ("f" "FF" entry (file+datetree "~/Documents/org/ff.org")
           "* TODO %? :WORK:")
          ("e" "Education" entry (file "~/Documents/org/education.org")
           "* TODO %?")
          ("n" "Notes" entry (file "~/Documents/org/notes.org")
           "* %? :NOTE:"))))

;; ========================= To be continued... ================================
