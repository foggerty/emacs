(use-package elixir-mode)
(use-package exunit)
(require 'eldoc-box)

(add-hook 'eldoc-mode-hook 'eglot-ensure)

(add-to-list 'eglot-server-programs
             `(elixir-mode "~/dev/elixir-ls/release/language_server.sh"))
