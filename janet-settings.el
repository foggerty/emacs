(use-package janet-mode)

(load-file "~/.emacs.d/inf-janet.el")
(require 'inf-janet)

(add-hook 'janet-mode-hook (qif (paredit-mode)
                                (aggressive-indent-mode)
                                (inf-janet-minor-mode)))


