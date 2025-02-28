(use-package go-ts-mode
  :config
  (setq gofmt-command "goimports") ; go get golang.org/x/tools/cmd/goimports

  :custom
  (tab-width 3)

  :bind
  (:map go-mode-map
        ("C-c C-p" . go-playground)
        ("C-c C-c C-d" . godoc-at-point)))

(use-package go-eldoc)

(use-package go-playground)

(add-hook 'go-ts-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'gofmt-before-save  nil 'local)))

(add-hook 'go-ts-mode-hook 'eglot-ensure)
