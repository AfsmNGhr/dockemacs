;; ================================ Tramp ======================================

(require  'tramp)
(setq-default tramp-persistency-file-name nil
              tramp-default-method "scp")
(tramp-set-completion-function "ssh"
                               '((tramp-parse-sconfig "/etc/ssh_config")
                                 (tramp-parse-sconfig "~/.ssh/config")))
(tramp-parse-shostkeys "/etc/ssh2/hostkeys/*")
(tramp-parse-shostkeys "~/.ssh2/hostkeys/*")

;; ================================= Sudo ======================================

;; (defun sudo-edit-current-file ()
;;   (interactive)
;;   (let ((my-file-name) ; fill this with the file to open
;;         (position))    ; if the file is already open save position
;;     (if (equal major-mode 'dired-mode) ; test if we are in dired-mode
;;         (progn
;;           (setq my-file-name (dired-get-file-for-visit))
;;           (find-alternate-file (prepare-tramp-sudo-string my-file-name)))
;;       (setq my-file-name (buffer-file-name)
;;             position (point))
;;       (find-alternate-file (prepare-tramp-sudo-string my-file-name))
;;       (goto-char position))))

;; (defun prepare-tramp-sudo-string (tempfile)
;;   (if (file-remote-p tempfile)
;;       (let ((vec (tramp-dissect-file-name tempfile)))

;;         (tramp-make-tramp-file-name
;;          "sudo"
;;          (tramp-file-name-user nil)
;;          (tramp-file-name-host vec)
;;          (tramp-file-name-localname vec)
;;          (format "ssh:%s@%s|"
;;                  (tramp-file-name-user vec)
;;                  (tramp-file-name-host vec))))
;;     (concat "/sudo:root@localhost:" tempfile)))

;; (define-key dired-mode-map [s-return] 'sudo-edit-current-file)

;; ========================= To be continued... ================================
