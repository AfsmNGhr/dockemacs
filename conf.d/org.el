;; ============================== Org mode =====================================

(use-package org :defer 30
  :config
  (setq org-log-done t
        org-startup-indented t
        org-todo-keywords
        '((sequence "TODO" "INPROGRESS" "HOLD" "DONE" "CANCELLED"))
        org-todo-keyword-faces
        '(("INPORGRESS" :foreground "DodgerBlue2" :weight bold)))
  (define-prefix-command 'org-todo-keys)
  (define-key org-mode-map "\C-cx" 'org-todo-keys)
  (define-key org-todo-keys "t"
    '(lambda () (interactive) (org-todo "TODO") (org-clock-out-if-current)))
  (define-key org-todo-keys "n"
    '(lambda () (interactive) (org-todo "NEXT") (org-clock-out-if-current)))
  (define-key org-todo-keys "h"
    '(lambda () (interactive) (org-todo "HOLD") (org-clock-out-if-current)))
  (define-key org-todo-keys "d"
    '(lambda () (interactive) (org-todo "DONE") (org-clock-out-if-current)))
  (define-key org-todo-keys "i"
    '(lambda () (interactive) (org-todo "INPROGRESS") (org-clock-in)))
  (define-key org-todo-keys "c"
    '(lambda () (interactive) (org-todo "CANCELLED") (org-clock-out-if-current)))

;; ============================ Org agenda =====================================

  (define-key global-map "\C-cl" 'org-store-link)
  (define-key global-map "\C-ca" 'org-agenda)
  (define-key global-map "\C-cc" 'org-capture)
  (require 'org-protocol)

  (setq org-agenda-files (directory-files "~/Documents/org/" t "\.org$" nil)
        org-clock-persist 'history
        org-agenda-clockreport-parameter-plist
        (quote (:link t :maxlevel 5 :fileskip0 t :compact t :narrow 80))
        org-protocol-default-template-key "l"
        org-capture-templates
        '(("t" "Tasks" entry (file "~/Documents/org/tasks.org")
           "* TODO %?\n SCHEDULED: %^t")
          ("l" "Links" entry (file+datetree "~/Documents/org/links.org")
           "* %c :LINK:\n%U %?%:initial")
          ("d" "Diary" entry (file+datetree "~/Documents/org/diary.org")
           "* %?")
          ("h" "Hopox" entry (file+datetree "~/Documents/org/hopox.org")
           "* TODO %? :WORK: ")
          ("f" "FF" entry (file+datetree "~/Documents/org/ff.org")
           "* DONE %? :WORK:")
          ("e" "Education" entry (file "~/Documents/org/education.org")
           "* TODO %?")
          ("n" "Notes" entry (file "~/Documents/org/notes.org")
           "* %? :NOTE:")))
  (org-clock-persistence-insinuate))

;; ============================= Org Drill =====================================

  ;; (use-package org-plus-contrib :defer t :ensure t)
  ;; (use-package org-drill :defer t
  ;;   :load-path "~/.emacs.d/packages/org-drill"
  ;;   :config (setq org-drill-hide-item-headings-p t
  ;;                 org-drill-maximum-items-per-session 40
  ;;                 org-drill-maximum-duration 30
  ;;                 org-drill-spaced-repetition-algorithm 'sm2))
  ;; (use-package org-drill-table :defer t :ensure t))

;; ========================= To be continued... ================================
