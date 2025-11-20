;;; -*- lexical-binding: t; -*-

;;;; NOTE install: rubocop, erb, solargraph
;;;; via gem install.

(require 'helpers)

(use-package flymake-ruby)

(use-package ruby-electric
  :hook
  (ruby-ts-mode . ruby-electric-mode)
  (ruby-ts-mode . eglot-ensure))

(setq auto-mode-alist
      (append '(("\\.rb\\'"      . ruby-ts-mode)
                ("\\.rxml\\'"    . ruby-ts-mode)
                ("\\.rjs\\'"     . ruby-ts-mode)
                ("\\.irbrc\\'"   . ruby-ts-mode)
                ("\\.pryrc\\'"   . ruby-ts-mode)
                ("\\.builder\\'" . ruby-ts-mode)
                ("\\.gemspec\\'" . ruby-ts-mode)
                ("Kirkfile\\'"   . ruby-ts-mode))
              auto-mode-alist))

(add-to-list 'major-mode-remap-alist '(ruby-mode . ruby-ts-mode))

;; Electric-mode is stoooopid when it comes to handling
;; parens and quotes.
(require 'ruby-electric)

(define-key ruby-electric-mode-map (kbd "\"") nil)
(define-key ruby-electric-mode-map (kbd "'") nil)
(define-key ruby-electric-mode-map (kbd "(") nil)
(define-key ruby-electric-mode-map (kbd "[") nil)
(define-key ruby-electric-mode-map (kbd "`") nil)

(define-key ruby-electric-mode-map (kbd ")") nil)
(define-key ruby-electric-mode-map (kbd "]") nil)
