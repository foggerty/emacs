(helper-install-packages '(flymake-ruby
			   inf-ruby
			   projectile-rails
			   helm-rails
			   ruby-electric
			   enh-ruby-mode))

(defun custom-ruby-mode ()
  (local-set-key (kbd "C-c r r") 'inf-ruby-console-auto)
  ;; todo - add these to prog-mode-hook, but NOT when in lisp?
  (local-set-key (kbd "M-<up>") 'move-line-up)
  (local-set-key (kbd "M-<down>") 'move-line-down)
  (add-hook 'projectile-mode-hook 'projectile-rails-on)
  (ruby-electric-mode t))
  
(add-hook 'enh-ruby-mode-hook 'custom-ruby-mode)
