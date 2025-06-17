;;; -*- lexical-binding: t; -*-

(require 'helpers)

(use-package visual-fill-column
  :config
  (setq visual-fill-column-width 120))

(add-hook 'text-mode-hook (qif (flyspell-mode)
                               (visual-line-mode)
                               (visual-fill-column-mode)))

(defun txt-remove-soft-returns ()
  "Replaces soft-returns (a single return with a character ether side of
it) with a single space.  Also, I fucking HATE Emacs regexs."
  (interactive)
  (save-excursion
    (beginning-of-buffer)
    (replace-regexp "\\(.\\)\n\\(.\\)"
                    "\\1 \\2")))
