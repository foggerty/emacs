(defun my-lisp-mode ()
  (paredit-mode 1))

(add-hook 'emacs-lisp-mode-hook 'my-lisp-mode)
