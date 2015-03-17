;; ==================================== Smex ===================================

(add-to-list 'load-path "~/.emacs.d/plugins/commands/smex")
(require 'smex)
(smex-initialize)
(smex-auto-update 600)

;; ==================================== Date ===================================

(defun insert-date ()
  "Insert a time-stamp according to locale's date and time format."
  (interactive)
  (insert (format-time-string "%c" (current-time))))

;; ========================= To be continued... ================================
