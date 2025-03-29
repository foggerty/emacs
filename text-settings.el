;;; -*- lexical-binding: t; -*-

(require 'advice)
(require 'helpers)

(use-package visual-fill-column
  :custom
  (fill-column 80)
  (visual-fill-column-width 120))

(add-hook 'text-mode-hook (qif (flyspell-mode)
                               (visual-line-mode)
                               (visual-fill-column-mode)))
