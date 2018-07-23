(use-package company-go)			  ; go get github.com/mdempsky/gocode
(use-package go-eldoc)
(use-package go-playground)

(use-package go-mode
  :config
  (setq gofmt-command "goimports") ; go get golang.org/x/tools/cmd/goimports

  :custom
  (tab-width 3)
  
  :bind
  (:map go-mode-map
		  ("C-<return>" . company-go) ; I CANNOT bloody get this to work automatically :-(
		  ("M-." . godef-jump)			; go get github.com/rogpeppe/godef
		  ("M-," . pop-tag-mark)
		  ("C-c C-p" . go-playground)
		  ("C-c C-c C-d" . godoc-at-point)))

(add-hook 'before-save-hook 'gofmt-before-save)
