(require 'init.el)
(require 'undercover-init.el)

(describe "defun: `my/initialize'"
  (it "default params"
      (expect (princ default-tab-width) :to-be 2)))
