;; -*- lexical-binding: t -*-

(defconst old-gc-cons-threshold gc-cons-threshold
  "Default GC threshold, saved during early initialization.")

(setq gc-cons-threshold most-positive-fixnum)

(defun restore-gc-cons-threshold ()
  "Set the `gc-cons-threshold' back to `old-gc-cons-threshold'.
Remember to save it there beforehand."
  (when (fixnump old-gc-cons-threshold)
    (setq gc-cons-threshold old-gc-cons-threshold)))

(add-hook 'emacs-startup-hook #'restore-gc-cons-threshold)

(provide 'early-init)
;;; early-init.el ends here
