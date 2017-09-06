;; ============================== Org mode =====================================

(use-package org :defer 30 :pin melpa
  :init
  (setq org-log-done t
        org-src-fontify-natively t
	      org-edit-src-content-indentation 2
        org-src-tab-acts-natively t
        org-src-preserve-indentation t
        org-startup-indented t
        org-src-ask-before-returning-to-edit-buffer nil
        org-todo-keywords
        '((sequence "TODO" "INPROGRESS" "HOLD" "DONE" "CANCELLED"))
        org-todo-keyword-faces
        '(("INPORGRESS" :foreground "DodgerBlue2" :weight bold)))
  (add-hook 'kill-emacs-hook (lambda () (org-save-all-org-buffers)))
  (define-prefix-command 'org-todo-keys)
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

  (defconst my/org-dir (getenv "ORG_PATH"))
  (if (> (length my/org-dir) 0)
      (setq org-agenda-files (directory-files my/org-dir t "\.org$" nil)
            org-agenda-clockreport-parameter-plist
            (quote (:link t :maxlevel 5 :fileskip0 t :compact t :narrow 80))
            org-protocol-default-template-key "L"))

  (use-package org-capture
    :init
    (defconst my/org-capture-templates
      '(("L" "Links" entry (file+datetree (concat my/org-dir "links.org"))
         "* %c :LINK:\n%U %?%:initial")
        ("d" "Diary" entry (file+datetree (concat my/org-dir "diary.org"))
         "* %?\n%U\n" :clock-in t :clock-resume t)
        ("w" "Work" entry (file+datetree (concat my/org-dir "work.org"))
         "* TODO %?\n%U\n" :clock-in t :clock-resume t)
        ("f" "Freelance" entry (file+datetree
                                (concat my/org-dir "freelance.org"))
         "* TODO %?\n%U\n" :clock-in t :clock-resume t)
        ("e" "Education" entry (file
                                (concat my/org-dir "education.org"))
         "* TODO %?\n%U\n" :clock-in t :clock-resume t)))
    (setq org-capture-templates my/org-capture-templates))

  (use-package org-clock
    :init
    (setq org-clock-history-length 23
          org-clock-in-resume t
          org-clock-into-drawer t
          org-clock-out-remove-zero-time-clocks t
          org-clock-out-when-done t
          org-clock-persist 'history
          org-clock-clocked-in-display 'mode-line
          org-clock-persist-query-resume nil
          org-clock-report-include-clocking-task t)
    (org-clock-persistence-insinuate))

  :bind
  (:map org-mode-map ("\C-cx" . org-todo-keys)))

;; ========================= To be continued... ================================
