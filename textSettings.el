;; Text mode
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)
(add-hook 'text-mode-hook  ; Disable auto-complete for text mode
	  (lambda () (company-mode -1)))
(require 'flyspell)
(add-hook 'text-mode-hook 'flyspell-mode)
