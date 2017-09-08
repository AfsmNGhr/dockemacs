;; ============================== Org mode =====================================

(use-package org :defer 30 :pin melpa
  :init
  (defconst my/org-dir (getenv "ORG_PATH"))

  (add-hook 'kill-emacs-hook (lambda () (org-save-all-org-buffers)))

  (defun my/current-task-change-status (status)
    "Change status for current task and stop."
    (interactive)
    (when (org-clocking-p)
      (org-clock-goto)
      (org-todo status)
      (org-clock-out)
      (save-buffer)
      (switch-to-prev-buffer)))

  (setq org-log-done t
        org-startup-indented t
        org-todo-keywords
        '((sequence "TODO" "NEXT" "INPROGRESS" "HOLD" "DONE" "CANCELLED")))

  (define-prefix-command 'org-todo-keys)

  (define-key org-todo-keys "t"
    '(lambda ()
       (interactive)
       (org-todo "TODO")
       (org-clock-out-if-current)))
  (define-key org-todo-keys "n"
    '(lambda ()
       (interactive)
       (org-todo "NEXT")
       (org-clock-out-if-current)))
  (define-key org-todo-keys "h"
    '(lambda ()
       (interactive)
       (org-todo "HOLD")
       (org-clock-out-if-current)))
  (define-key org-todo-keys "d"
    '(lambda ()
       (interactive)
       (org-todo "DONE")
       (org-clock-out-if-current)))
  (define-key org-todo-keys "i"
    '(lambda ()
       (interactive)
       (org-todo "INPROGRESS")
       (my/current-task-change-status "HOLD")
       (org-clock-in)))
  (define-key org-todo-keys "c"
    '(lambda ()
       (interactive)
       (org-todo "CANCELLED")
       (org-clock-out-if-current)))

  (use-package org-faces
    :init
    (setq org-todo-keyword-faces
          '(("INPROGRESS" :foreground "DodgerBlue2" :weight bold)
            ("HOLD" :foreground "firebrick2" :weight bold)
            ("NEXT" :foreground "OrangeRed2" :weight bold))))

  (use-package org-src
    :init
    (setq org-src-fontify-natively t
          org-edit-src-content-indentation 2
          org-src-tab-acts-natively t
          org-src-preserve-indentation t
          org-src-ask-before-returning-to-edit-buffer nil))

  (use-package org-agenda
    :init
    (setq org-agenda-files (directory-files my/org-dir t "\.org$" nil)
          org-agenda-clockreport-parameter-plist
          (quote (:link t :maxlevel 5 :fileskip0 t :compact t :narrow 80)))
    :bind
    (:map global-map ("C-c a" . org-agenda)))

  (use-package org-protocol
    :init
    (setq org-protocol-default-template-key "L"))

  (use-package org-capture
    :init
    (defconst my/org-capture-templates
      '(("L" "Links" entry (file+datetree (concat my/org-dir "links.org"))
         "* %c :LINK:\n%U %?%:initial")
        ("d" "Diary" entry (file+datetree (concat my/org-dir "diary.org"))
         "* %?\n%U\n" :clock-in t :clock-resume t)
        ("w" "Work" entry (file+datetree (concat my/org-dir "work.org"))
         "* TODO %? :WORK:\n%U\n" :clock-in t :clock-resume t)
        ("f" "Freelance" entry (file+datetree
                                (concat my/org-dir "freelance.org"))
         "* TODO %? :FREELANCE:\n%U\n" :clock-in t :clock-resume t)
        ("e" "Education" entry (file
                                (concat my/org-dir "education.org"))
         "* TODO %?\n%U\n" :clock-in t :clock-resume t)))
    (setq org-capture-templates my/org-capture-templates)
    :bind
    (:map global-map ("C-c c" . org-capture)))

  (use-package org-clock
    :init
    (setq org-clock-history-length 23
          org-clock-continuously t
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
  (:map org-mode-map
   ("C-c x" . org-todo-keys)
   :map global-map
   ("C-c l" . org-store-link)))

;; ========================= To be continued... ================================
