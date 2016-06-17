;; Text mode

(require 'flyspell)

(defun my-text-mode ()
  (company-mode -1)
  (flyspell-mode)
  (visual-line-mode))
 
(add-hook 'text-mode-hook 'my-text-mode)
