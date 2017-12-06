(require 'init.el)
(require 'undercover-init.el)

(describe "Indentation"
  (it "tab offset"
      (expect (princ default-tab-width) :to-be 2))
  (it "space indentation"
      (expect (princ indett-tabs-mode) :to-be nil)))
