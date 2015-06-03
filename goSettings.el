;; GO
;; NOTE(s) (to self) - use local-set-key in the function definition,
;; also look up go-oracle and go-flymake

(require 'go-mode)
(defun custom-go-mode-hook ()
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'go-mode-hook (lambda ()
			    (set
			     (make-local-variable 'company-backends)
			     '(company-go)))))

(add-hook 'go-mode-hook 'custom-go-mode-hook)
