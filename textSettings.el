;; Text mode

(require 'flyspell)

(defun my-text-mode ()
  (company-mode -1)
  (flyspell-mode)
  (visual-line-mode))
 
