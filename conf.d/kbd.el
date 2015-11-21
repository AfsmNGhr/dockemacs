;; ========================== Ergoemacs-mode ===================================

(global-set-key (kbd "C-x w") 'kill-buffer-and-window)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-x o") 'ace-window)
(global-set-key (kbd "M-2") 'quick-cut-line)
(global-set-key (kbd "M-3") 'quick-copy-line)
(global-set-key (kbd "<mouse-2>") 'x-clipboard-yank)
(global-set-key "\C-w" 'clipboard-kill-region)
(global-set-key "\M-w" 'clipboard-kill-ring-save)
(global-set-key "\C-y" 'clipboard-yank)

;; ======================== Reverse-input-method ===============================

(defun reverse-input-method (input-method)
    "build the reverse mapping of single letters from input-method."
    (interactive
     (list (read-input-method-name "use input method (default current): ")))
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
                (define-key local-function-key-map
                  (vector (append mod (list from)))
                  (vector (append mod (list to)))))))))
      (when input-method
        (activate-input-method current))))

(defun is-interactive-frame-available ()
  (and (not noninteractive)
       (not (and (daemonp)
                 (null (cdr (frame-list)))
                 (eq (selected-frame) terminal-frame)))))

(defmacro* exec-after-interactive-frame-available
    ((&rest captures) &rest body)
  (declare (indent defun))
  `(if (is-interactive-frame-available)
       (progn ,@body)
     (lexical-let (,@(mapcar #'(lambda (c) (list c c)) captures))
       (add-hook 'after-make-frame-functions
                 #'(lambda (frame)
                     (with-selected-frame frame
                       ,@body))))))

(exec-after-interactive-frame-available ()
   (reverse-input-method "russian-computer")
   (setq read-passwd-map
         (let ((map read-passwd-map))
           (set-keymap-parent map minibuffer-local-map)
           (define-key map [return] #'exit-minibuffer)
           (define-key map [backspace] #'delete-backward-char)
           map)))

;; ========================= To be continued... ================================
