;; Text mode

(require 'flyspell)

(add-hook 'text-mode-hook  
			 (lambda ()
				(company-mode -1)
				(flyspell-mode)
				(visual-line-mode)))
