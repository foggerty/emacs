;;;; NOTE install:
;;;;    rubocop, erb, solargraph
;;;; via gem install.

(use-package robe)
(use-package flymake-ruby)

(use-package ruby-electric
  :hook
  (ruby-mode . ruby-electric-mode)
  (ruby-mode . robe-mode)
  (ruby-mode . eglot))

