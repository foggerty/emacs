;; Text mode

(add-hook 'text-mode-hook (qif (flyspell-mode)
                               (company-mode -1)
                               (visual-line-mode)))
