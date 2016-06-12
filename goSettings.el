(helper-install-packages
 '(company-go
	go-eldoc))

(require 'go-mode)

(defun custom-go-mode-hook ()
  (setq gofmt-command "~/go/bin/goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (set (make-local-variable 'company-backends)
		 '(company-go))
  (flyspell-mode)
  (company-mode)
  (add-hook 'go-mode-hook 'go-eldoc-setup)
  (local-set-key (kbd "C-c C-c C-d") 'godoc-at-point))

(add-hook 'go-mode-hook 'custom-go-mode-hook)
