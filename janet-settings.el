(use-package janet-mode
  :bind
  (:map janet-mode-map
        ("C-c C-b" . inf-janet-eval-buffer)))

(add-hook 'janet-mode-hook (qif (paredit-mode)
                                (aggressive-indent-mode)
                                (inf-janet-minor-mode-hook)))
