;; Text mode

(defun foggerty-text-mode ()
(require 'flyspell)
  (company-mode -1)
   (flyspell-mode)
   (visual-line-mode))

(add-hook 'text-mode-hook 'foggerty-text-mode)

	  
