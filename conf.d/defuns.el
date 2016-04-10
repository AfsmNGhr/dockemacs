; ================================ Testing error ===============================

(defun emacs-test ()
  (interactive)
  (require 'async)
  (async-start
   (lambda () (shell-command-to-string
                         "emacs --batch --eval \"
(condition-case e
    (progn
      (load \\\"~/.emacs.d/init.el\\\")
      (message \\\"-OK-\\\"))
  (error
   (message \\\"ERROR!\\\")
   (signal (car e) (cdr e))))\""))
   `(lambda (output)
      (if (string-match "-OK-" output)
          (when ,(called-interactively-p 'any)
            (message "All is well"))
        (switch-to-buffer-other-window "*startup error*")
        (delete-region (point-min) (point-max))
        (insert output)
        (search-backward "ERROR!")))))

;; ==================================== Copy ===================================

(defun quick-copy-line ()
          "Copy the whole line that point is on and
move to the beginning of the next line.
    Consecutive calls to this command append each line to the
    kill-ring."
          (interactive)
          (let ((beg (line-beginning-position 1))
                (end (line-beginning-position 2)))
            (if (eq last-command 'quick-copy-line)
                (kill-append (buffer-substring beg end) (< end beg))
              (kill-new (buffer-substring beg end))))
          (beginning-of-line 2))

;; ==================================== Cut ====================================

(defun quick-cut-line ()
    "Cut the whole line that point is on.
Consecutive calls to this command append each line to the kill-ring."
    (interactive)
    (let ((beg (line-beginning-position 1))
          (end (line-beginning-position 2)))
      (if (eq last-command 'quick-cut-line)
          (kill-append (buffer-substring beg end) (< end beg))
        (kill-new (buffer-substring beg end)))
      (delete-region beg end))
    (beginning-of-line 1)
    (setq this-command 'quick-cut-line))

; ================================ Comment =====================================

 (defun comment-or-uncomment-region-or-line ()
   "Comments or uncomments the region or the current line if there's no active region."
   (interactive)
   (let (beg end)
     (if (region-active-p)
         (setq beg (region-beginning) end (region-end))
       (setq beg (line-beginning-position) end (line-end-position)))
     (comment-or-uncomment-region beg end)
     (next-line)))

;; ========================= To be continued... ================================
