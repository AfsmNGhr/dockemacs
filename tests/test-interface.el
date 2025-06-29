;;; -*- lexical-binding: t; -*-

(require 'undercover-init.el)

(describe "Indentation"
          (it "tab offset"
              (expect (princ tab-width) :to-be 2))
          (it "always indent"
              (expect (princ tab-always-indent) :to-be 'complete))
          (it "space indentation"
              (expect (princ indent-tabs-mode) :to-be nil)))

(describe "Customize"
          (it "custom file"
              (expect (princ custom-file)
                      :to-equal null-device)))

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
              (expect (princ display-time-format) :to-equal "%H:%M"))
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

(describe "Built-in modes"
          (it "visual-line"
              (expect (princ global-visual-line-mode) :to-be t))
          (it "font-lock"
              (expect (princ global-font-lock-mode) :to-be t))
          (it "auto-revert"
              (expect (princ global-auto-revert-mode) :to-be t))
          (it "delete-selection"
              (expect (princ delete-selection-mode) :to-be t)))

(describe "External browser"
          (it "url-browser-function"
              (expect (princ browse-url-browser-function)
                      :to-be 'browse-url-generic))
          (it "url-generic-program"
              (expect (princ browse-url-generic-program)
                      :to-equal "/usr/local/sbin/browser-remote")))

(describe "Dired"
          (it "listing-switches"
              (expect (princ dired-listing-switches) :to-equal "-lhvA")))

(describe "Unsorted"
          (it "parent-style"
              (expect (princ show-paren-style) :to-be 'mixed))
          (it "word-wrap"
              (expect (princ word-wrap) :to-be t))
          (it "search-highlight"
              (expect (princ search-highlight) :to-be t))
          (it "query-replace-highlight"
              (expect (princ query-replace-highlight) :to-be t))
          (it "select-enable-clipboard"
              (expect (princ select-enable-clipboard) :to-be t))
          (it "echo-keystrokes"
              (expect (princ echo-keystrokes) :to-equal 0.1))
          (it "enable-local-eval"
              (expect (princ enable-local-eval) :to-be t)))
