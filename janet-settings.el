(use-package janet-mode)

(add-hook 'janet-mode-hook #'paredit-mode)
(add-hook 'janet-mode-hook #'aggressive-indent-mode)
