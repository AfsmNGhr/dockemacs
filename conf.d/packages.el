;; ============================== El-get =======================================

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       (concat
        "https://raw.githubusercontent.com/dimitri/"
        "el-get/master/el-get-install.el"))
    (goto-char (point-max))
    (eval-print-last-sexp)))

(setq el-get-recipe-path '("~/.emacs.d/el-get/el-get/recipes/")
      my:el-get-packages
      '(
        ;; benchmark
        benchmark-init

        ;; kbd
        ergoemacs-mode

        ;; Features
        yasnippet popup auto-complete git-gutter multiple-cursors
        linum-ex smex flx ido-hacks

        ;; Ruby
        flymake-ruby rvm dash rubocop rspec-mode rinari
        smartparens

        ;; Php
        php-mode php-mode-improved mmm-mode

        ;; Org
        org-mode

        ;; lisp, cl, clj
        slime swank-clojure clojure-mode rainbow-delimiters cider

        ;; Templates
        slim-mode yaml-mode sass-mode scss-mode css-complete
        rhtml-mode markdown-mode

        ;; JS
        js2-mode coffee-mode ac-js2 tern js-comint js3-mode

        )
      ;; el-get-sources '((:name smex))
      my:el-get-packages (append my:el-get-packages
                                 (mapcar #'el-get-source-name el-get-sources)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/recipes")
(el-get-cleanup my:el-get-packages)
(el-get 'sync my:el-get-packages)

;; ========================= To be continued... ================================
