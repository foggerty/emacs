;; Settings that apply to more than one programming mode

(use-package paredit
  :defer t)

(use-package aggressive-indent
  :defer t)

(add-hook 'prog-mode-hook (qif (flyspell-prog-mode)
                               (diminish 'paredit-mode)
                               (diminish 'eldoc-mode)
                               (electric-pair-mode)
                               (show-paren-mode t)))
