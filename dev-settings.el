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

;; LSP (Language Server protocol) support.

(use-package lsp-mode
  :defer t
  :config (setq lsp-lens-mode nil))

(use-package company-lsp
  :defer t
  :after company
  :config (push 'company-lsp company-backends))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-doc-enable nil
        lsp-ui-doc-max-width 80
        lsp-ui-doc-use-webkit t
        lsp-ui-doc-position 'top))

(use-package yasnippet
  :defer t)

(use-package treemacs
  :defer t)

;;(use-package lsp-treemacs)

