(use-package geiser
  :defer t
  :interpreter "bb"
  :config
  (enable-paredit-mode)
  (aggressive-indent-mode 1)
  (setq geiser-active-implementations '(janet)))


