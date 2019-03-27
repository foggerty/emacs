;; Settings that apply to all programming modes.

(use-package paredit)

(use-package aggressive-indent)

(defun foggerty-dev-mode ()
  (company-mode-on)
  (flyspell-prog-mode)
  (diminish 'paredit-mode)
  (diminish 'eldoc-mode))

(add-hook 'prog-mode-hook 'foggerty-dev-mode)

;; Various Lisp modes - to do, try out parinfer.
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)


;; LSP (Language Server protocol) support.
(use-package lsp-mode)
(use-package lsp-ui)
(use-package company-lsp
  :after company
  :config
  (setq lsp-auto-guess-root t))

