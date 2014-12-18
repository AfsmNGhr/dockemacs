;; ==================================== Rinary =================================

(require 'ido)
(ido-mode t)

(add-to-list 'load-path "~/.emacs.d/plugins/ruby/rinari")
(require 'rinari)
(global-rinari-mode)

(setf
 my-rinari-jump-schema
 '((my-stylesheet "y" ((t . "app/assets/stylesheets/.*")) nil)
   (my-javascript "j" ((t . "app/assets/javascripts/.*")) nil)
   (my-spine-application "a" ((t . "app/assets/javascripts/app/.*\\.js\\.coffee")) nil)
   (my-spine-lib "l" ((t . "app/assets/javascripts/app/lib/.*")) nil)
   (my-spine-model "m" ((t . "app/assets/javascripts/app/models/.*")) nil)
   (my-spine-view "v" ((t . "app/assets/javascripts/app/views/.*")) nil)
   (my-soine-index "r" ((t . "app/assets/javascripts/app/.*")) nil)

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

   (my-request-rspec "r" ((t . "spec/requests/.*")) nil)
))

(rinari-apply-jump-schema my-rinari-jump-schema)

(define-key rinari-minor-mode-map (kbd "C-c m") 'rinari-find-model)
(define-key rinari-minor-mode-map (kbd "C-c M") 'rinari-find-mailer)
(define-key rinari-minor-mode-map (kbd "C-c c") 'rinari-find-controller)
(define-key rinari-minor-mode-map (kbd "C-c o") 'rinari-find-configuration)
(define-key rinari-minor-mode-map (kbd "C-c a") 'rinari-find-application)
(define-key rinari-minor-mode-map (kbd "C-c e") 'rinari-find-environment)
(define-key rinari-minor-mode-map (kbd "C-c h") 'rinari-find-helper)
(define-key rinari-minor-mode-map (kbd "C-c v") 'rinari-find-view)
(define-key rinari-minor-mode-map (kbd "C-c i") 'rinari-find-migration)
(define-key rinari-minor-mode-map (kbd "C-c l") 'rinari-find-lib)
(define-key rinari-minor-mode-map (kbd "C-c r") 'rinari-find-my-request-rspec)
(define-key rinari-minor-mode-map (kbd "C-c t") 'rinari-find-my-rspec)
(define-key rinari-minor-mode-map (kbd "C-c f") 'rinari-find-my-fabrication)
(define-key rinari-minor-mode-map (kbd "C-c y") 'rinari-find-my-stylesheet)
(define-key rinari-minor-mode-map (kbd "C-c d") 'rinari-find-my-decorator)
(define-key rinari-minor-mode-map (kbd "C-c j") 'rinari-find-my-javascript)
(define-key rinari-minor-mode-map (kbd "C-c C-c a") 'rinari-find-my-spine-application)
(define-key rinari-minor-mode-map (kbd "C-c C-c m") 'rinari-find-my-spine-model)
(define-key rinari-minor-mode-map (kbd "C-c C-c r") 'rinari-find-my-spine-index)
(define-key rinari-minor-mode-map (kbd "C-c C-c v") 'rinari-find-my-spine-view)
(define-key rinari-minor-mode-map (kbd "C-c C-c l") 'rinari-find-my-spine-lib)
(define-key rinari-minor-mode-map (kbd "C-l x") 'rinari-extract-partial)
(define-key rinari-minor-mode-map (kbd "C-l c") 'rinari-console)
(define-key rinari-minor-mode-map (kbd "C-l s") 'rinari-web-server)
(define-key rinari-minor-mode-map (kbd "C-l r") 'rinari-web-server-restart)
(define-key rinari-minor-mode-map (kbd "C-l p") 'rinari-cap)

(defun my-find-gemfile ()
  (interactive)
  (find-file (concat (rinari-root) "Gemfile")))
(define-key rinari-minor-mode-map (kbd "C-c g") 'my-find-gemfile)

;; ========================= To be continued... ================================
