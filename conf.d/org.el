;; ============================== Org mode =====================================

(use-package org :defer 30 :pin melpa
  :config
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

  (defconst my/org-dir (getenv "ORG_PATH"))
  (if (> (length my/org-dir) 0)
      (setq org-agenda-files (directory-files my/org-dir t "\.org$" nil)
            org-agenda-clockreport-parameter-plist
            (quote (:link t :maxlevel 5 :fileskip0 t :compact t :narrow 80))
            org-protocol-default-template-key "l"
            org-capture-templates
            '(("t" "Tasks" entry (file (concat my/org-dir "tasks.org"))
               "* TODO %?\n SCHEDULED: %^t")
              ("L" "Links" entry (file+datetree (concat my/org-dir "links.org"))
               "* %c :LINK:\n%U %?%:initial")
              ("d" "Diary" entry (file+datetree (concat my/org-dir "diary.org"))
               "* %?")
              ("h" "Hopox" entry (file+datetree (concat my/org-dir "hopox.org"))
               "* TODO %? :WORK: ")
              ("f" "FF" entry (file+datetree (concat my/org-dir "ff.org"))
               "* DONE %? :WORK:")
              ("e" "Education" entry (file (concat my/org-dir "education.org"))
               "* TODO %?")
              ("n" "Notes" entry (file (concat my/org-dir "notes.org"))
               "* %? :NOTE:"))))

  (defvar org-babel-default-header-args:screen
    '((:results . "silent") (:session . "default") (:cmd . "sh") (:terminal . "xterm"))
    "Default arguments to use when running screen source blocks.")

  (org-clock-persistence-insinuate)

  ;; (use-package org-brain :ensure t :defer t
  ;;   :config
  ;;   (setq org-brain-path (concat my/org-dir "brain")))
  )

(use-package org-clock :defer t
  :config
  (setq org-clock-history-length 23
        org-clock-in-resume t
        org-clock-into-drawer t
        org-clock-out-remove-zero-time-clocks t
        org-clock-out-when-done t
        org-clock-persist t
        org-clock-persist-query-resume nil
        org-clock-report-include-clocking-task t))

(add-hook 'kill-emacs-hook (lambda () (org-save-all-org-buffers)))

;; ============================= Org Drill =====================================

;; (use-package org-plus-contrib :defer t :ensure t)
;; (use-package org-drill :defer t
;;   :load-path "~/.emacs.d/packages/org-drill"
;;   :config (setq org-drill-hide-item-headings-p t
;;                 org-drill-maximum-items-per-session 40
;;                 org-drill-maximum-duration 30
;;                 org-drill-spaced-repetition-algorithm 'sm2))
;; (use-package org-drill-table :defer t :ensure t))

;; (use-package ledger-mode :defer t :ensure t)

;; ========================= To be continued... ================================
