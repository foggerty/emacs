;; (use-package ruby-end)

(use-package ruby-electric
  :hook
  (ruby-mode . ruby-electrice))

(use-package inf-ruby)
(use-package company-inf-ruby)

;; (use-package enh-ruby-mode
;;   :hook ruby-mode
;;   :config
;;   (add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode)))

;; (use-package inf-ruby
;;   :hook ruby-mode
;;   :bind (("C-c r r" . inf-ruby)
;;          ("C-c C-b" . ruby-send-buffer)))
