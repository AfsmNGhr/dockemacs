;; =============================== Clojure =====================================

(defvar clj-path "~/.emacs.d/el-get/")

(add-to-list 'load-path (concact clj-path "clojure-mode"))
(require 'clojure-mode)

(add-to-list 'load-path (concact clj-path "rainbow-delimiters"))
(require 'rainbow-delimiters)

(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)

(add-to-list 'load-path (concact clj-path "cider"))
(require 'cider-mode)

(add-to-list 'load-path "~/.emacs.d/plugins/clojure/clojure-cookbook")
(defun increment-clojure-cookbook ()
  "When reading the Clojure cookbook, find the next section, and
close the buffer. If the next section is a sub-directory or in
the next chapter, open Dired so you can find it manually."
  (interactive)
  (let* ((cur (buffer-name))
     (split-cur (split-string cur "[-_]"))
     (chap (car split-cur))
     (rec (car (cdr split-cur)))
     (rec-num (string-to-number rec))
     (next-rec-num (1+ rec-num))
     (next-rec-s (number-to-string next-rec-num))
     (next-rec (if (< next-rec-num 10)
               (concat "0" next-rec-s)
             next-rec-s))
     (target (file-name-completion (concat chap "-" next-rec) "")))
    (progn
      (if (equal target nil)
      (dired (file-name-directory (buffer-file-name)))
    (find-file target))
      (kill-buffer cur))))

(define-key adoc-mode-map (kbd "M-+") 'increment-clojure-cookbook)
(add-hook 'adoc-mode-hook 'cider-mode)

;; ========================= To be continued... ================================
