;; Note - install before geiser
(use-package paredit)

(use-package geiser
     :interpreter "scm"
     :config
     (eldoc-mode)
     (enable-paredit-mode)
     (show-paren-mode t)
     (setq geiser-active-implementations '(guile)))




