(helper-install-packages '(flymake-ruby
									inf-ruby
									projectile-rails
									robe
									helm-rails))

(defun custom-ruby-mode ()
  (flymake-ruby-load)
  (setq ruby-deep-indent-param)
  (global-set-key (kbd "C-c r r") 'inf-ruby)
  (local-set-key (kbd "M-<up>") 'move-line-up)
  (local-set-key (kbd "M-<down>") 'move-line-down)  
  (add-hook 'projectile-mode 'projectile-rails-mode)

  ;; I really need to read up on this stuff...
  (setq enh-ruby-program "/usr/local/bin/ruby")
  (autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
  (add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rake$" . enh-ruby-mode))
  (add-to-list 'auto-mode-alist '("Rakefile$" . enh-ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.gemspec$" . enh-ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.ru$" . enh-ruby-mode))
  (add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))
  (add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))

  (ruby-electric-mode t)
  (push 'company-robe company-backends)
  (add-to-list))

(add-hook 'ruby-mode-hook 'custom-ruby-mode)
