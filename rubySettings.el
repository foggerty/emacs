(helper-install-packages '(flymake-ruby
									inf-ruby
									projectile-rails
									helm-rails
									enh-ruby-mode))

(defun custom-ruby-mode ()
  (flymake-ruby-load)
  (global-set-key (kbd "C-c r r") 'inf-ruby-console-auto)
  (local-set-key (kbd "M-<up>") 'move-line-up)
  (local-set-key (kbd "M-<down>") 'move-line-down)
  (add-hook 'projectile-mode 'projectile-rails-mode)
  (ruby-electric-mode t)
  (add-to-list 'auto-mode-alist
               '("\\.\\(?:cap\\|gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . enh-ruby-mode))
  (add-to-list 'auto-mode-alist
               '("\\(?:Brewfile\\|Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . enh-ruby-mode)))

(add-hook 'ruby-mode-hook 'custom-ruby-mode)
