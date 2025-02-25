(use-package inf-elixir)
(use-package mix)

(use-package elixir-ts-mode
  :hook ((elixir-mode . inf-elixir-minor-mode)
         (elixir-mode . eglot-ensure)))

(add-to-list 'eglot-server-programs
             '(elixir-mode "~/bin/elixir_ls/language_server.sh"))
