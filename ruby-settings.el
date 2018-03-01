;;(use-package ruby-end)

(use-package ruby-electric
  :hook ruby-mode)

(use-package inf-ruby
  :hook ruby-mode
  :bind ("C-c r r" . inf-ruby))

(use-package robe
  :hook ruby-mode)

(use-package rvm)

(add-hook 'ruby-mode-hook 'flymake-mode)
(add-hook 'ruby-mode-hook 'ruby-electric-mode) ; why is this needed??

(eval-after-load 'company
  '(push 'company-robe company-backends))
