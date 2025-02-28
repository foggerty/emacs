;;; -*- lexical-binding: t; -*-

;;;; I've just copied the elisp from lilypond's source tree, as it's
;;;; not in any of the repositories.

(add-to-list 'load-path
             (concat (file-name-as-directory user-emacs-directory) "lilypond"))

(autoload 'LilyPond-mode "lilypond-mode")

(setq auto-mode-alist
      (cons '("\\.ly$" . LilyPond-mode) auto-mode-alist))

(add-hook 'LilyPond-mode-hook (lambda () (turn-on-font-lock)))
