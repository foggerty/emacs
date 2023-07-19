(use-package janet-mode)

(add-hook 'janet-mode  (qif (paredit-mode)
                            (aggressive-indent-mode)
                            (inf-janet-minor-mode))
