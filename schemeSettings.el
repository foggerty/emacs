
(helper-install-packages '(geiser))

(add-hook 'scheme-hook-mode
			 (lambda ()
				(paredit-mode 1)
				(local-set-key (kbd "C-k") 'paredit-kill)
				(local-set-key (kbd "C-c C-c") 'geiser-doc-symbol-at-point)))

(setq geiser-active-implementations '(guile))


