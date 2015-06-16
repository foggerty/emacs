(add-hook 'scheme-hook-mode
			 (lambda ()
				(enable-paredit-mode)
				(local-set-key (kbd "C-k") 'paredit-kill)))
