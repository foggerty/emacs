(helper-install-packages
 '(company-go
	 go-eldoc
	 go-guru))

(require 'go-mode)

(defun custom-go-mode-hook ()
	;; requires goimports
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)

	;; requires gocode
  (set (make-local-variable 'company-backends)
			 '(company-go))
  (company-mode)

	;; eldoc - documentation in the mini buffer
	(add-hook 'go-mode-hook 'go-eldoc-setup)
  (local-set-key (kbd "C-c C-c C-d") 'godoc-at-point)

	;; go-def
	(local-set-key (kbd "M-.") 'godef-jump)
	(local-set-key (kbd "M-,") 'pop-tag-mark)
	(local-set-key (kbd "C-/") 'comment-region)
	(local-set-key (kbd "C-?") 'uncomment-region)

	;; Autocomplete setting for go only (move to main if I like these)
	(setq-local company-tooltip-limit 20) ; bigger popup window
	(setq-local company-idle-delay .3) ; decrease delay before autocompletion popup shows
	(setq-local company-echo-delay 0) ; remove annoying blinking
	(setq-local company-begin-commands '(self-insert-command))

	;; requires go guru
	(go-guru-hl-identifier-mode)
	
	;; thinking of making this global.....
	(aggressive-indent-mode)

	;; compiler / test / vet (linter)
	(if (not (string-match "go" compile-command))
			(set (make-local-variable 'compile-command)
					 "go build -v && go test ./.. && go vet"))

	;; Finally, the ENV variables required by the go tools.
	(let* ((home (getenv "HOME"))
				 (path (concat home "/go"))
				 (bin (concat path "/bin")))
		(setenv "GOPATH" path)
		(setenv "GOBIN" bin)))

(helper-add-hook 'go-mode-hook 'custom-go-mode-hook)
