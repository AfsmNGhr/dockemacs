;; =============================== Ruby  =======================================

(use-package ruby-mode
  :defer t
  :mode ("\\.cr\\'" . ruby-mode))

(use-package rinari
  :ensure t :defer t
  :config
  (setf
     my-rinari-jump-schema
     '((my-stylesheet "y" ((t . "app/assets/stylesheets/.*")) nil)
       (my-javascript "j" ((t . "app/assets/javascripts/.*")) nil)
       (my-spine-application "a" ((t . "app/assets/javascripts/app/.*\\.js\\.coffee")) nil)
       (my-spine-lib "l" ((t . "app/assets/javascripts/app/lib/.*")) nil)
       (my-spine-model "m" ((t . "app/assets/javascripts/app/models/.*")) nil)
       (my-spine-view "v" ((t . "app/assets/javascripts/app/views/.*")) nil)
       (my-spine-index "r" ((t . "app/assets/javascripts/app/.*")) nil)

       (my-fabrication "f" ((t . "spec/fabricators/.*")) nil)
       (my-rspec
        "t"
        (("app/models/\\1.rb"                      . "spec/models/\\1_spec.rb")
         ("app/controllers/\\1.rb"                 . "spec/controllers/\\1_spec.rb")
         ("app/views/\\1\\..*"                     . "spec/views/\\1_spec.rb")
         ("lib/\\1.rb"                             . "spec/libs/\\1_spec.rb")
         ("db/migrate/.*_create_\\1.rb"            . "spec/models/\\1_spec.rb")
         ("config/routes.rb"                       . "spec/routing/.*\\.rb")
         (t                                        . "spec/.*\\.rb"))
        t)

       (my-decorator
        "d"
        (("app/models/\\1.rb"                      . "app/decorators/\\1_decorator.rb")
         ("app/controllers/\\1.rb"                 . "app/decorators/\\1_decorator.rb")
         ("app/views/\\1\\..*"                     . "app/decorators/\\1_decorator.rb")
         ("db/migrate/.*_create_\\1.rb"            . "app/decorators/\\1_decorator.rb")
         (t                                        . "app/decorators/.*\\.rb"))
        t)

       (my-request-rspec "r" ((t . "spec/requests/.*")) nil)))
  (rinari-apply-jump-schema my-rinari-jump-schema)
  (defun my-find-gemfile ()
    (interactive)
    (find-file (concat (rinari-root) "Gemfile"))))

(use-package bundler :ensure t :defer t)

(use-package rvm
  :ensure t :defer t :init (rvm-use-default))

(use-package rubocop
  :ensure t :defer t
  :init
  (add-hook 'ruby-mode-hook 'rubocop-mode))

(use-package robe
  :ensure t :defer t
  :init
  (progn (add-hook 'ruby-mode-hook 'robe-mode)
         (push 'company-robe company-backends)
         (add-hook 'ruby-mode-hook 'flycheck-mode)))

(use-package rhtml-mode
  :ensure t :defer t
  :mode
  (("\\.jst\\.eco$" . rhtml-mode)
   ("\\.html\\.erb$" . rhtml-mode)))

(use-package rspec-mode
  :ensure t :defer t
  :config
  (eval-after-load 'rspec-mode
    '(rspec-install-snippets)))

;; ========================= To be continued... ================================
