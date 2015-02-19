;; ============================== Habitrpg =====================================

(defvar *org-path* "~/.emacs.d/plugins/org/")
(add-to-list 'load-path (concat *org-path* "habitrpg.el"))
(require 'habitrpg)

(defun my/habitrpg-add ()
  "Add habitrpg task require api token in secrets"
  (interactive)
  (load-file "~/.emacs.d/secrets/secrets.el.gpg")
  (habitrpg-add))

(defun my/habitrpg-status ()
  "Status habitrpg require api token in secrets"
  (interactive)
  (load-file "~/.emacs.d/secrets/secrets.el.gpg")
  (habitrpg-status))

(add-hook 'org-after-todo-state-change-hook 'my/habitrpg-add 'append)

(global-set-key (kbd "C-c C-x h") 'my/habitrpg-add)
(global-set-key (kbd "C-c a") 'my/habitrpg-status)

;; ========================= To be continued... ================================
