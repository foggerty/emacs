;;; -*- lexical-binding: t; -*-

;;;; NOTE install: rubocop, erb, solargraph
;;;; via gem install.

(require 'helpers)

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

(setq auto-mode-alist
      (append '(("\\.rxml\\'"    . ruby-ts-mode)
                ("\\.rjs\\'"     . ruby-ts-mode)
                ("\\.irbrc\\'"   . ruby-ts-mode)
                ("\\.pryrc\\'"   . ruby-ts-mode)
                ("\\.builder\\'" . ruby-ts-mode)
                ("\\.gemspec\\'" . ruby-ts-mode)
                ("Kirkfile\\'"   . ruby-ts-mode))
              auto-mode-alist))
