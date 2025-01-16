;(require 'inf-janet)

(use-package janet-mode
  :bind
  (("C-C C-c" . inf-janet-eval-defunq)))

(load-file "~/.emacs.d/ajsc.el")

(require 'ajsc)

(add-hook 'janet-mode-hook (qif (paredit-mode)
                                (aggressive-indent-mode)
                                (ajsc-interaction-mode)))

