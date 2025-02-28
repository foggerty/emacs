;;; -*- lexical-binding: t; -*-

(add-hook 'emacs-lisp-mode-hook
          (qif 
           (aggressive-indent-mode)
           (hungry-delete-mode)
           (local-set-key (kbd "C-c C-r") 'eval-region)
           (local-set-key (kbd "C-h C-l") 'find-library)
           (local-set-key (kbd "C-h C-f") 'find-function)
           (local-set-key (kbd "C-C C-b") 'eval-buffer)))

(add-hook 'ielm-mode-hook (qif ;;(enable-paredit-mode)
                           (aggressive-indent-mode)
                           (hungry-delete-mode)))
