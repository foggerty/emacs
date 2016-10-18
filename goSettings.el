(helper-install-packages
 '(
	 company-go
	 go-dlv
	 go-eldoc
	 go-errcheck
	 go-guru
	 go-playground
	 go-rename
	 go-mode
	 ))

(require 'go-mode)
(require 'company-go)

(exec-path-from-shell-copy-env "GOPATH")
(exec-path-from-shell-copy-env "GOROOT")

(flycheck-gometalinter-setup)

;; Go tooling is great, but there's a bit too much of it to remember
;; all of names or keybindings...
(easy-menu-define go-popup-menu nil nil
	'("Wunder Gopher:" 
		("Guru"
		 ["Callees" go-guru-callees]
		 ["Callers" go-guru-callers]
		 ["Callstack" go-guru-callstack]
		 ["Freevars" go-guru-freevars]
		 ["Implements" go-guru-implements]
		 ["Referrers" go-guru-referrers]
		 "---"
		 ["Set scope for Go Guru" go-guru-set-scope])
		("Testing"
		 ["Project" go-test-current-project]
		 ["File" go-test-current-file]
		 ["Current test" go-test-current-test]
		 "---"
		 ["Coverage" go-test-current-coverage])
		("Benchmarking"
		 ["Project" go-test-current-project-qbenchmarks]
		 ["File" go-test-current-file-benchmarks]
		 ["Current Benchmark" go-test-current-benchmark])))

(defun go-popup-menu ()
	(interactive)
	(popup-menu go-popup-menu (point)))

;; to do : make this more general, pass in the various folding
;; characters, and move into random-functions.el.
(defun helper-hs-toggle-hiding ()
	(interactive)
	(save-excursion
		(let ((test (thing-at-point 'line t)))
			(when (string-match "{" test)
				(search-forward "{"))
			(hs-toggle-hiding))))

(defun custom-go-mode-hook ()
	;; requires goimports
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)

	;; Make gometalinte slightly faster
	(setq flycheck-gometalinter-fast t)

	;; requires gocode
  (set (make-local-variable 'company-backends)
			 '(company-go))
  (company-mode)

	;; eldoc - documentation in the mini buffer
	(add-hook 'go-mode-hook 'go-eldoc-setup)
  (local-set-key (kbd "C-c C-c C-d") 'godoc-at-point)

	;; keybindings specific to go
	(local-set-key (kbd "M-.") 'godef-jump)
	(local-set-key (kbd "M-,") 'pop-tag-mark)
	(local-set-key (kbd "C-/") 'comment-region)
	(local-set-key (kbd "C-?") 'uncomment-region)
	(local-set-key (kbd "C-c C-p") 'go-playground)
	(local-set-key (kbd "<f10>") 'go-popup-menu)

	;; Autocomplete setting for go only (move to main if I like these)
	(setq-local company-tooltip-limit 20) ; bigger popup window
	(setq-local company-idle-delay 0) ; only show on demand
	(setq-local company-echo-delay 0) ; remove annoying blinking
	(setq-local company-begin-commands '(self-insert-command))

	;; requires go guru
	(go-guru-hl-identifier-mode)
	
	;; compiler / test / vet (linter)
	(if (not (string-match "go" compile-command))
			(set (make-local-variable 'compile-command)
					 "../build.sh"))

	;; enable code folding
	(hs-minor-mode)
	(local-set-key (kbd "M-<tab>") 'helper-hs-toggle-hiding))

(helper-add-hook 'go-mode-hook 'custom-go-mode-hook)

