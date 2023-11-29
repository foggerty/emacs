(require 'inf-janet)

(use-package janet-mode
  :bind
  (("C-c C-b" . inf-janet-eval-buffer)
   ("C-C C-c" . inf-janet-eval-defunq)))

(add-hook 'janet-mode-hook  (qif (paredit-mode)
                                 (aggressive-indent-mode)
                                 (inf-janet-minor-mode)))
