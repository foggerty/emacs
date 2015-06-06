;; Text mode

(require 'flyspell)

(add-hook 'text-mode-hook  ; Disable auto-complete for text moade
			 (lambda ()
				(company-mode -1)
				(flyspell-mode)
				(visual-line-mode)))
