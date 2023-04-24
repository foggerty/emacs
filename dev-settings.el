;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Settings/packages that apply to or are used by more than one
;;;; programming mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package flymake)
(use-package aggressive-indent)
(use-package highlight-parentheses)
(use-package paredit)
(use-package markdown-mode)

;; (use-package git-timemachine
;;   :bind
;;   (("C-c t" . git-timemachine-toggle)))

;; See here: https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/
;; for a complete list ogf LSP settings.

(use-package eglot
  :config
  (push :codeLensProvider eglot-ignored-server-capabilities))

(add-hook 'prog-mode-hook (qif (diminish 'paredit-mode)
                               (diminish 'eldoc-mode)
                               (electric-pair-mode)
                               (show-paren-mode 1)
                               (highlight-parentheses-mode nil)))

(setq eldoc-echo-area-use-multiline-p 1)
