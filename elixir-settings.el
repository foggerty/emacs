;;; -*- lexical-binding: t; -*-

(require 'eglot)
(require 'helpers)

(use-package elixir-ts-mode
  :hook ((elixir-ts-mode . inf-elixir-minor-mode)
         (elixir-ts-mode . eglot-ensure)
         (elixir-ts-mode . electric-pair-mode))
  :bind
  (:map elixir-ts-mode-map
        (("C-x C-e"  . #'inf-elixir-send-line)
         ("C-c -C-r" . #'inf-elixir-send-region)
         ("C-c C-b"  . #'inf-elixir-send-buffer)))
  :config
  (add-to-alist 'auto-mode-alist
                '(("\\.ex\\'" . elixir-ts-mode)
                  ("\\.exs\\'" . elixir-ts-mode))))

(add-to-list 'eglot-server-programs
             '(elixir-ts-mode    "~/bin/language_servers/elixir/language_server.sh"))

(use-package inf-elixir)
(use-package mix)
