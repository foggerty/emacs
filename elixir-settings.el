;;; -*- lexical-binding: t; -*-

(use-package elixir-mode)
(use-package inf-elixir)
(use-package mix)

(require 'eglot)

(use-package elixir-ts-mode
  :hook ((elixir-mode . inf-elixir-minor-mode)
         (elixir-mode . eglot-ensure)
         (elixir-mode . elixir-ts-mode)
         (elixir-mode . electric-pair-mode)))

(add-to-list 'eglot-server-programs
             '(elixir-mode "~/bin/elixir_ls/language_server.sh"))
