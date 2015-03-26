;; ================================== Php ======================================

(require 'flymake)

(defun flymake-php-init ()
  "Use php to check the syntax of the current file."
  (let* ((temp (flymake-init-create-temp-buffer-copy
                'flymake-create-temp-inplace))
         (local (file-relative-name temp
                                    (file-name-directory buffer-file-name))))
    (list "php" (list "-f" local "-l"))))

(add-to-list 'flymake-err-line-patterns
             '("\\(Parse\\|Fatal\\) error: +\\(.*?\\) in \\(.*?\\) on line \\([0-9]+\\)$" 3 4 nil 2))

(add-to-list 'flymake-allowed-file-name-masks '("\\.php$" flymake-php-init))

;; Drupal-type extensions
(add-to-list 'flymake-allowed-file-name-masks '("\\.module$" flymake-php-init))
(add-to-list 'flymake-allowed-file-name-masks '("\\.install$" flymake-php-init))
(add-to-list 'flymake-allowed-file-name-masks '("\\.inc$" flymake-php-init))
(add-to-list 'flymake-allowed-file-name-masks '("\\.engine$" flymake-php-init))

(add-to-list 'load-path "~/.emacs.d/ef-get/mmm-mode")
(require 'mmm-mode)
(add-hook 'php-mode-hook (lambda ()
                           (flymake-mode 1)))
(define-key php-mode-map '[M-S-up] 'flymake-goto-prev-error)
(define-key php-mode-map '[M-S-down] 'flymake-goto-next-error)

;; ========================= To be continued... ================================
