(add-hook 'emacs-lisp-mode-hook
          (qif (enable-paredit-mode)
               (local-set-key (kbd "C-c C-r") 'eval-region)
               (local-set-key (kbd "C-c C-b") 'eval-buffer)
               (local-set-key (kbd "C-h C-l") 'find-library)
               (local-set-key (kbd "C-h C-f") 'find-function)))

(add-hook 'ielm-mode-hook 'enable-paredit-mode)
