;; I'm pretty much conflating Scheme and Geiser here :-)

(use-package geiser
  :interpreter "scm"
  :config
  (enable-paredit-mode)
  (aggressive-indent-mode 1)
  (setq geiser-active-implementations '(guile)))
