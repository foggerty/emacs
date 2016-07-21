(helper-install-packages '(flymake-ruby
									inf-ruby
									projectile-rails
									;ruby-eletric
									robe))
;(require 'robe)
;(require 'ruby-electric)

(defun custom-ruby-mode ()
  (flymake-ruby-load)
  (setq ruby-deep-indent-param)
  (global-set-key (kbd "C-c r r") 'inf-ruby)
  (add-hook 'projectile-mode 'projectile-rails-mode)
  (robe-mode)
  (ruby-electric-mode t)
  (push 'company-robe company-backends)
  (add-to-list))

(add-hook 'ruby-mode-hook 'custom-ruby-mode)
