;;; -*- lexical-binding: t; -*-

;;;; NOTE install:
;;;;    rubocop, erb, solargraph
;;;; via gem install.

(use-package robe
  :hook
  ;; ToDO - setup bindings
  (ruby-mode    . robe-mode)
  (ruby-ts-mode . robe-mode))

(use-package ruby-electric
  :hook
  (ruby-mode    . ruby-electric-mode)
  (ruby-ts-mode . ruby-electric-mode))

(add-hook 'ruby-mode 'eglot-ensure)
(add-hook 'ruby-ts-mode 'eglot-ensure)
