(defun my-lisp-mode ()
  (paredit-mode 1)
  (smartparens-mode 0)
  (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
  (flycheck-mode 0))

(add-hook 'emacs-lisp-mode-hook 'my-lisp-mode)

