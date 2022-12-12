;; I'm pretty much conflating Scheme and Janet here :-)

(use-package geiser
  :defer t
  :interpreter "bb"
  :config
  (enable-paredit-mode)
  (aggressive-indent-mode 1)
  (setq geiser-active-implementations '(janet)))

(use-package janet-mode)
