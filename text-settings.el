;;; -*- lexical-binding: t; -*-

(use-package visual-fill-column)

(defadvice set-fill-column (after refresh-visual-fill-column last activate)
  "Will check if visual-fill-column-mode is active, and adjust
margins if so."
  (visual-fill-column-adjust))

(setq fill-column 120)
(setq visual-fill-column-width 120)

(add-hook 'text-mode-hook (qif (flyspell-mode)
                               (visual-line-mode)
                               (visual-fill-column-mode)))
