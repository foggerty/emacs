;;; -*- lexical-binding: t; -*-

;;;; go install golang.org/x/tools/gopls@latest
;;;; go install golang.org/x/tools/cmd/goimports@latest

(use-package go-eldoc)
(require 'go-mode)

(use-package flymake-go)

(use-package go-ts-mode
  :config
  (setq gofmt-command "goimports"
        go-ts-mode-indent-offset 4)
  :hook
  ((go-ts-mode . eglot-ensure)
   (go-ts-mode . electric-pair-mode))
  :bind
  (:map go-ts-mode-map
        ("C-c C-q" . gofmt)
        ("C-c C-d" . godoc-at-point)))
