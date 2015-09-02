;; =========================== Compile elisp ===================================

(defun byte-compile-current-buffer ()
  "`byte-compile' current buffer if it's emacs-lisp-mode
   and compiled file exists."
  (interactive)
  (when (and (eq major-mode 'emacs-lisp-mode)
             (file-exists-p (byte-compile-dest-file buffer-file-name)))
    (byte-compile-file buffer-file-name)))

;; ================================ Hooks ======================================

(add-hook 'after-save-hook 'byte-compile-current-buffer)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; ========================= To be continued... ================================
