;; =========================== Templates...  ==================================

(add-to-list 'auto-mode-alist '("\\.jst\\.eco$" . rhtml-mode))

;; =============================== Ruby =======================================

(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))

;; =============================== JS =========================================

(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.js.coffee$" . coffee-mode))

;; ============================= Yaml ==========================================

(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-hook 'yaml-mode-hook
      '(lambda ()
         (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; ============================= Sass ==========================================

(setq exec-path (cons
                 (expand-file-name ".rvm/rubies/ruby-2.1.4/bin") exec-path))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

;; ========================= To be continued... ================================
