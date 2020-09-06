(use-package company-go
  :defer t
  :requires go-mode)         ; go get github.com/mdempsky/gocode

(use-package go-eldoc
  :defer t
  :requires go-mode)

(use-package go-playground
  :defer t
  :requires go-mode)

(use-package go-mode
  :config
  (setq gofmt-command "goimports") ; go get golang.org/x/tools/cmd/goimports

  :custom
  (tab-width 3)

  :bind
  (:map go-mode-map
        ("C-<return>" . company-go) ; I CANNOT bloody get this to work automatically :-(
        ("C-c C-p" . go-playground)
        ("C-c C-c C-d" . godoc-at-point)))


(add-hook 'go-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'gofmt-before-save  nil 'local)))

(add-hook 'go-mode-hook 'eglot-ensure)
