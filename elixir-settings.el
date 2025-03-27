;;; -*- lexical-binding: t; -*-

(use-package elixir-mode)
(use-package inf-elixir)
(use-package mix)

(require 'eglot)

(use-package elixir-ts-mode
  :hook ((elixir-mode . inf-elixir-minor-mode)
         (elixir-mode . eglot-ensure)
         (elixir-mode . elixir-ts-mode)
         (elixir-mode . electric-pair-mode))
  :bind
  (("C-x C-e"  . #'inf-elixir-send-line)
   ("C-c -C-r" . #'inf-elixir-send-region)
   ("C-c C-b"  . #'inf-elixir-send-buffer)))

(add-to-list 'eglot-server-programs
             '(elixir-mode "~/bin/language_servers/elixir/language_server.sh"))
