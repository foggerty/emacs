;;; -*- lexical-binding: t; -*-

(require 'cc-mode)
(require 'c-ts-mode)

;; Requires a .clang-format file
(use-package clang-format
  :defer t
  :config
  (setq clang-format-style "file")
  :bind
  (:map c++-ts-mode-map
        ("C-c C-q" . clang-format-buffer)))

(add-hook 'c++-ts-mode-hook 'eglot-ensure)
(add-hook 'c-or-c++-mode-hook 'eglot-ensure)

(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))
