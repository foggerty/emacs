(defun my-lisp-mode ()
  (paredit-mode 1)
  (add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
  (local-set-key (kbd "C-c C-e C-e") 'eval-buffer)
  (local-set-key (kbd "C-l") 'find-library)  ; C-h C-l
  (local-set-key (kbd "C-f") 'find-function) ; C-h C-f
  (local-set-key (kbd "C-k") 'find-function-on-key) ; C-h C-k
  (flycheck-mode 0)
  (smartparens-mode 0))

(add-hook 'emacs-lisp-mode-hook 'my-lisp-mode)

