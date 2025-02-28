;;; -*- lexical-binding: t; -*-

;;;; NOTE install:
;;;;    rubocop, erb, solargraph
;;;; via gem install.

(use-package robe
  :hook
  ;; ToDO - setup bindings
  (ruby-mode . robe-mode))

(use-package ruby-electric
  :hook
  (ruby-mode . ruby-electric-mode))

(add-hook 'ruby-mode 'eglot-ensure)
