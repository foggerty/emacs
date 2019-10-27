;; Settings that apply to more than one programming mode

(use-package paredit)
(use-package aggressive-indent)

(add-hook 'prog-mode-hook (qif (flyspell-prog-mode)
                               (diminish 'paredit-mode)
                               (diminish 'eldoc-mode)
                               (electric-pair-mode)
                               (show-paren-mode t)))


;; LSP (Language Server protocol) support.

(use-package lsp-mode
  :hook (prog-mode . lsp)
  :config (setq lsp-lens-mode nil))

(use-package company-lsp
  :after company
  :config (push 'company-lsp company-backends))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode))

(use-package yasnippet)
(use-package treemacs)
(use-package lsp-treemacs)
