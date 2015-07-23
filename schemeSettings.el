
(helper-install-packages '(geiser))

(defun foggerty-indent-enclosing-sexp ()
  (save-excursion
	 ;; Jump to outermost sexp
	 
	 (indent-sexp)))


(add-hook 'scheme-hook-mode
			 (lambda ()
				(enable-paredit-mode)
				(local-set-key (kbd "C-k") 'paredit-kill)
				(local-set-key (kbd "C-M-q") 'foggerty-indent-enclosing-sexp)
				(local-set-key (kbd "C-c C-c") 'geiser-doc-symbol-at-point)))

(setq geiser-active-implementations '(guile))


