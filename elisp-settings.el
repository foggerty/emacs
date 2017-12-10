(defun foggerty-elisp-mode ()
  (enable-paredit-mode)
  (turn-on-eldoc-mode)
  (company-mode)
  (local-set-key (kbd "C-c C-e C-e") 'eval-buffer)
  (local-set-key (kbd "C-h C-l") 'find-library)
  (local-set-key (kbd "C-h C-f") 'find-function))

(add-hook 'emacs-lisp-mode-hook 'foggerty-elisp-mode)