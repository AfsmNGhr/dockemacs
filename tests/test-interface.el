(require 'undercover-init.el)

(describe "Indentation"
          (it "tab offset"
              (expect (princ default-tab-width) :to-be 2))
          (it "always indent"
              (expect (princ tab-always-indent) :to-be 'complete))
          (it "space indentation"
              (expect (princ indent-tabs-mode) :to-be nil)))

(describe "Customize"
          (it "custom file"
              (expect (princ custom-file)
                      :to-be (concat user-emacs-directory "custom.el"))))

(describe "UI"
          (it "menu-bar"
              (expect (princ menu-bar-mode) :to-be nil))
          (it "tool-bar"
              (expect (princ tool-bar-mode) :to-be nil))
          (it "column-number"
              (expect (princ column-number-mode) :to-be nil))
          (it "blink-cursor"
              (expect (princ blink-cursor-mode) :to-be nil))
          (it "line-number"
              (expect (princ line-number-mode) :to-be nil))
          (it "size-indication"
              (expect (princ size-indication-mode) :to-be nil))
          (it "ring-bell-function"
              (expect (princ ring-bell-function) :to-be 'ignore)))

(describe "Time"
          (it "interval"
              (expect (princ display-time-interval) :to-be 1))
          (it "format"
              (expect (princ display-time-format) :to-be "%H:%M"))
          (it "load-average"
              (expect (princ display-time-default-load-average) :to-be nil))
          (it "active?"
              (expect (princ display-time-mode) :to-be t)))

(describe "Dialog"
          (it "box"
              (expect (princ use-dialog-box) :to-be nil))
          (it "file"
              (expect (princ use-file-dialog) :to-be nil))
          (it "epa"
              (expect (princ epa-pinentry-mode) :to-be 'loopback)))
