;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Settings that apply to more than one programming mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package aggressive-indent
  :defer t)

(use-package highlight-parentheses)

(use-package markdown-mode)

(use-package paredit
  :ensure t)

(use-package git-timemachine
  :bind
  (("C-c t" . git-timemachine-toggle)))

(add-hook 'prog-mode-hook (qif (diminish 'paredit-mode)
                               (diminish 'eldoc-mode)
                               (electric-pair-mode)
                               (show-paren-mode 1)
                               (highlight-parentheses-mode 1)))

(setq eldoc-echo-area-use-multiline-p 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Tree-sitter
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq major-mode-remap-alist
      '((c++-mode . c++-ts-mode)
        '(c-mode .  c-ts-mode)
        '(go-mode . go-ts-mode)
        '(yaml-mode . yaml-ts-mode)
        '(bash-mode . bash-ts-mode)
        '(js-mode . js-ts-mode)
        '(css-mode . css-ts-mode)
        '(ruby-mode . ruby-ts-mode)))
