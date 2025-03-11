;;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Programming modes without much setup/config required.
;;;
;;

(use-package systemd
  :config
  (add-to-list 'auto-mode-alist '("\\.service\\'" . systemd-mode)))

(use-package yaml-mode)

(use-package markdown-mode
  :config
  (setq markdown-fontify-code-blocks-natively t))

(use-package sql-indent
  :hook
  (sql-mode . sqlind-minor-mode))

(use-package hyprlang-ts-mode
  :custom
  (hyprlang-ts-mode-indent-offset 4))

(use-package ron-mode)
