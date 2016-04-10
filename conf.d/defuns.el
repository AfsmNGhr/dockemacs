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
