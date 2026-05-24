;;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Programming modes without much setup/config required.
;;;
;;

(use-package ascii-table          :defer t)
(use-package pandoc-mode          :defer t)
(use-package qml-mode             :defer t)
(use-package ron-mode             :defer t)
(use-package yaml-mode            :defer t)
(use-package flymake-shell        :defer t)
(use-package flymake-css          :defer t)
(use-package flymake-yaml         :defer t)
(use-package flymake-markdownlint :defer t)
(use-package flymake-json         :defer t)
(use-package kdl-mode             :defer t)

(use-package systemd
  :defer t
  :config
  (append '(("\\.service\\'" . systemd-mode)
            ("\\.slice\\'" . systemd-mode)
            ("\\.socket\\'" . systemd-mode)
            ("\\.target\\'" . systemd-mode)
            ("\\.timer\\'" . systemd-mode))
          auto-mode-alist))

(use-package markdown-mode
  :hook
  ((markdown-mode . visual-line-mode))
  :config
  (setq markdown-fontify-code-blocks-natively t))

(use-package sql-indent
  :hook
  (sql-mode . sqlind-minor-mode))

(use-package hyprlang-ts-mode
  :defer t
  :mode "~\\./config/hypr/*.conf"
  :custom
  (hyprlang-ts-mode-indent-offset 4))

(use-package json-mode
  :mode "\\.json\\'")

(require 'nxml-mode)
(setq nxml-slash-auto-complete-flag t)
