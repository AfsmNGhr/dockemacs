(require 'my/init)
(require 'my/undercover)

(describe "defun: `my/initialize'"
  (it "check tab width"
    (expect (default-tab-width) :to-be 2))
