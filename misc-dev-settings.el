;;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Programming modes without much setup/config required.
;;;
;;

(use-package pandoc-mode)
(use-package yaml-mode)
(use-package ron-mode)
(use-package qml-mode)

(use-package systemd
  :config
  (add-to-list 'auto-mode-alist
               '("\\.service\\'" . systemd-mode)))

(use-package markdown-mode
  :config
  (setq markdown-fontify-code-blocks-natively t))

(use-package sql-indent
  :hook
  (sql-mode . sqlind-minor-mode))

(use-package hyprlang-ts-mode
  :custom
  (hyprlang-ts-mode-indent-offset 4))

(use-package json-mode
  :mode "\\.json\\'"
  :hook
  (json-mode . electric-pair-mode))

(require 'nxml-mode)
(setq nxml-slash-auto-complete-flag t)

(use-package flymake-shell)
(use-package flymake-css)
(use-package flymake-yaml)
(use-package flymake-markdownlint)
(use-package flymake-json)
