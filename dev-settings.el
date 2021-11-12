;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Settings that apply to more than one programming mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package paredit
  :defer t)

(use-package aggressive-indent
  :defer t)

(use-package eglot
  :ensure t
  :config)

(use-package git-timemachine
  :bind
  (("C-c t" . git-timemachine-toggle)))

(use-package json-mode)

(add-hook 'prog-mode-hook (qif (flyspell-prog-mode)
                               (diminish 'paredit-mode)
                               (diminish 'eldoc-mode)
                               (electric-pair-mode)
                               (show-paren-mode t)))

(setq eldoc-echo-area-use-multiline-p 1)
