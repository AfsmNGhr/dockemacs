(require 'undercover-init.el)

(describe "Indentation"
          (it "tab offset"
              (expect (princ default-tab-width) :to-be 2))
          (it "always indent"
              (expect (princ tab-always-indent) :to-be 'complete))
          (it "space indentation"
              (expect (princ indent-tabs-mode) :to-be nil)))

(describe "Garbage Collector"
          (it "treshold"
              (expect (princ gc-cons-threshold) :to-be 800000))
          (it "percentage"
              (except (princ gc-cons-percentage) :to-be 0.1)))
