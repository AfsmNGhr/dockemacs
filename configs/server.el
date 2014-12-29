;; ================================== Server ===================================

;; (if (locate-library "ediff-trees")
;;     (autoload 'ediff-trees "ediff-trees" "Start an tree ediff" t))

(defun autocompile nil
  "compile itself if ~/.emacs.d/init.el"
  (interactive)
  (require 'bytecomp)
  (let ((dotemacs (expand-file-name "~/.emacs.d/init.el")))
    (if (string= (buffer-file-name) (file-chase-links dotemacs))
        (byte-compile-file dotemacs))))

(add-hook 'after-save-hook 'autocompile)

;; ========================= To be continued... ================================
