(helper-install-packages '(geiser))

(add-hook 'scheme-hook-mode
			 (lambda ()
				(enable-paredit-mode)
				(local-set-key (kbd "C-k") 'paredit-kill)))

(setq geiser-active-implementations '(guile))

