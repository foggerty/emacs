(defun my-happy-emacs-mode ()
  (enable-paredit-mode)
  (turn-on-eldoc-mode)
  

(add-hook 'emacs-lisp-mode-hoook 'my-happy-emacs-mode)
