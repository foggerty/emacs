;; NOTE(s) (to self) - use local-set-key in the function definition,
;; also look up go-oracle and go-flymake

;; Ensure the required packages are loaded, and install them if not.
(helper-install-packages '(company-go go-eldoc))

(require 'go-mode)
(require 'go-flymake)

(defun custom-go-mode-hook ()
  (setq gofmt-command "/Users/matt/go/bin/goimports")
  (add-to-list 'load-path "/Users/matt/go/src/github.com/dougm/goflymake")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (set
	(make-local-variable 'company-backends)
	'(company-go))
  (flyspell-mode)
  (add-hook 'go-mode-hook 'go-eldoc-setup))

(add-hook 'go-mode-hook 'custom-go-mode-hook)
