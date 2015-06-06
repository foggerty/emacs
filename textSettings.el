;; Text mode

(require 'flyspell)
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'visual-line-mode)
(add-hook 'text-mode-hook  ; Disable auto-complete for text moade
	  (lambda () (company-mode -1)))
