;; ========================== Ergoemacs-mode ===================================

(add-to-list 'load-path "~/.emacs.d/plugins/kbd/ergoemacs-mode")
(require 'ergoemacs-mode)

(setq ergoemacs-theme nil)
(setq ergoemacs-keyboard-layout "us")
(ergoemacs-mode 1)

;; ======================== Reverse-input-mode =================================

(defun reverse-input-method (input-method)
  "Build the reverse mapping of single letters from INPUT-METHOD."
  (interactive
   (list (read-input-method-name "Use input method (default current): ")))
  (if (and input-method (symbolp input-method))
      (setq input-method (symbol-name input-method)))
  (let ((current current-input-method)
        (modifiers '(nil (control) (meta) (control meta))))
    (when input-method
      (activate-input-method input-method))
    (when (and current-input-method quail-keyboard-layout)
      (dolist (map (cdr (quail-map)))
        (let* ((to (car map))
               (from (quail-get-translation
                      (cadr map) (char-to-string to) 1)))
          (when (and (characterp from) (characterp to))
            (dolist (mod modifiers)
              (define-key (if mod input-decode-map local-function-key-map)
                (vector (append mod (list from)))
                (vector (append mod (list to)))))))))
    (when input-method
      (activate-input-method current))))

(defadvice read-passwd (around my-read-passwd act)
  (let ((local-function-key-map nil))
    ad-do-it))

(reverse-input-method 'russian-computer)

;; ================================ Bookmark ===================================

(global-set-key (kbd "`")         'bookmark-jump)
(global-set-key (kbd "C-x v")         'bookmark-set)
(global-set-key (kbd "s-SPC")         'bookmark-save)

;; ========================= To be continued... ================================
