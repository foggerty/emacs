;;; -*- lexical-binding: t; -*-

(require 'advice)
(require 'helpers)

(use-package visual-fill-column)

(setq fill-column 120)
(setq visual-fill-column-width 120)

(add-hook 'text-mode-hook (qif (flyspell-mode)
                               (visual-line-mode)
                               (visual-fill-column-mode)))
