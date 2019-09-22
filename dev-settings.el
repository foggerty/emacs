;; Settings that apply to all programming modes.

(use-package paredit)

(use-package aggressive-indent)

(defun foggerty-dev-mode ()
  (flyspell-prog-mode)
  (diminish 'paredit-mode)
  (diminish 'eldoc-mode))

(add-hook 'prog-mode-hook 'foggerty-dev-mode)

;; LSP (Language Server protocol) support.
(use-package lsp-mode)
(use-package lsp-ui)
(use-package company-lsp
  :after company
  :config
  (setq lsp-auto-guess-root t)
  (setq lsp-ui-mode nil))
