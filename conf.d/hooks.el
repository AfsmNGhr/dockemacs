;; =========================== Compile elisp ===================================

(defun byte-compile-current-buffer ()
  "`byte-compile' current buffer if it's emacs-lisp-mode
   and compiled file exists."
  (interactive)
  (when (and (eq major-mode 'emacs-lisp-mode)
             (file-exists-p (byte-compile-dest-file buffer-file-name)))
    (byte-compile-file buffer-file-name)))

;; ============================== Load hook ====================================

(defun load-hook (path)
  "Load files in hook directory"
  (interactive)
  (let ((hooks "~/.emacs.d/conf.d/hooks/"))
    (dolist (hook-files
             (directory-files (concat hooks path) t "\.el$" nil))
      (load (file-name-sans-extension hook-files) 'noerror))))

;; ================================ Hooks ======================================

(add-hook 'after-save-hook 'byte-compile-current-buffer)
(add-hook 'org-mode-hook (lambda () (load-hook "org")))
(add-hook 'js-mode-hook (lambda () (load-hook "js")))
(add-hook 'lisp-mode-hook (lambda () (load-hook "lisp")))
(add-hook 'ruby-mode-hook (lambda () (load-hook "ruby")))
(add-hook 'ruby-mode-hook (lambda () (load-hook "php")))
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; ========================= To be continued... ================================
