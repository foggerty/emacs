(use-package elixir-mode)
;;(use-package exunit)
(use-package inf-elixir)
(use-package mix)

(add-hook 'elixir-mode-hook 'eglot-ensure)
