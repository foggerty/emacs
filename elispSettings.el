(defun my-lisp-mode ()
  (paredit-mode 1)
  (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
  (local-set-key (kbd "C-c C-e C-e") 'eval-buffer)
  (flycheck-mode 0))

(add-hook 'emacs-lisp-mode-hook 'my-lisp-mode)

