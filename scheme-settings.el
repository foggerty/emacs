;; I'm pretty much conflating Scheme and Geiser here :-)

(use-package geiser
     :interpreter "scm"
     :config
     (eldoc-mode)
     (enable-paredit-mode)
     (show-paren-mode t)
     (setq geiser-active-implementations '(guile)))



