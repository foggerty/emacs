;;; -*- lexical-binding: t; -*-

(require 'helpers)

(add-hook 'emacs-lisp-mode-hook
          (qif
           (smartparens-strict-mode)
           (local-set-key (kbd "C-c C-r") 'eval-region)
           (local-set-key (kbd "C-h C-l") 'find-library)
           (local-set-key (kbd "C-h C-f") 'find-function)
           (local-set-key (kbd "C-C C-b") 'eval-buffer)))
