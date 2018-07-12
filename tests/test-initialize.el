(require 'undercover-init.el)

(describe "Garbage Collector on startup"
          (it "treshold"
              (expect (princ gc-cons-threshold) :to-be most-positive-fixnum))
          (it "percentage"
              (expect (princ gc-cons-percentage) :to-equal 0.6)))

(describe "File name handler"
          (it "alist"
              (expect (princ file-name-handler-alist) :to-be nil)))
