;; =========================== Compile elisp ===================================

(defun byte-compile-current-buffer ()
  "`byte-compile' current buffer if it's emacs-lisp-mode
   and compiled file exists."
  (interactive)
  (when (and (eq major-mode 'emacs-lisp-mode)
             (file-exists-p (byte-compile-dest-file buffer-file-name)))
    (byte-compile-file buffer-file-name)))

;; ============================== Autosave =====================================

(defun save-buffer-if-visiting-file (&optional args)
  "Save the current buffer only if it is visiting a file"
  (interactive)
  (if (and (buffer-file-name) (buffer-modified-p))
      (save-buffer args)))

;; ============================== close =====================================

(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (cl-letf (((symbol-function #'process-list) (lambda ())))
    ad-do-it))

;; ================================ Hooks ======================================

(add-hook 'after-save-hook 'byte-compile-current-buffer)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; (add-hook 'auto-save-hook 'save-buffer-if-visiting-file)

;; ========================= To be continued... ================================
