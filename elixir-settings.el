(use-package inf-elixir)
(use-package mix)
(use-package elixir-mode
  :hook ((elixir-mode . inf-elixir-minor-mode)
         (elixir-mode . eglot-ensure)))

(add-to-list 'eglot-server-programs
             '(elixir-mode "~/dev/elixir/elixir-ls/language_server.sh"))
