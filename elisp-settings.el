(use-package paredit)

(use-package srefactor)
(use-package srefactor-lisp
  :bind ("C-c C-q" . srefactor-lisp-format-buffer))

(defun my-happy-emacs-mode ()
  (enable-paredit-mode)
  (turn-on-eldoc-mode)
  (company-mode)
  (add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
  (local-set-key (kbd "C-c C-e C-e") 'eval-buffer))

(diminish 'paredit-mode)
(diminish 'eldoc-mode)

(add-hook 'emacs-lisp-mode-hook 'my-happy-emacs-mode)
