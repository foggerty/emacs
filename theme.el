;;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Basic tidy ups
;;;
;;

(require 'helpers)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(fringe-mode '(8 . 0))

(setq inhibit-startup-screen t)
(setq-default frame-title-format '("%b"))
(setq-default line-spacing 2) ; 2 extra pixels under lines

(add-to-alist 'default-frame-alist
              '((vertical-scroll-bars . nil)
                (menu-bar-lines . nil)
                (undecorated . t)
                (drag-internal-border . 1)
                (internal-border-width . 5)
                (alpha-background . 0.85)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Fonts
;;;
;;

(global-set-font '("Source Code Pro-12"
                   "Liberation Mono-12"
                   "Consolas-12"
                   "Monospace-12"
                   "Courier New-12"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Font overrides
;;;
;;

(custom-theme-set-faces
 'user
 '(variable-pitch ((t (:family "Cantarell" :width expanded :height 1.0 ))))
 '(fixed-pitch ((t ( :family "Source Code Pro" :height 1.0 :inherit 'default))))
 '(font-lock-comment-face ((t (:slant italic :weight semi-bold :background unspecified))))
 '(show-paren-match ((t (:underline nil :foreground "red"))))
 `(org-defult ((t (:inherit fixed-pitch))))
 '(org-level-1 ((t (:height 1.0))))
 '(org-level-2 ((t (:height 1.0))))
 '(org-block ((t (:inherit fixed-pitch))))
 `(org-block-begin-line ((t :background unspecified)))
 `(org-block-end-line ((t (:background unspecified))))
 '(org-code ((t (:inherit (shadow fixed-pitch)))))
 '(avy-lead-face ((t (:background unspecified))))
 '(avy-lead-face-0 ((t (:background unspecified)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Make pretty with themes etc.
;;;
;;

(use-package ewal-spacemacs-themes)
(use-package atom-dark-theme)

(cond ((or (daemonp) (display-graphic-p))
       (load-theme 'ewal-spacemacs-classic t))
      (t (load-theme 'atom-dark t)))

(defun on-frame-open (&optional frame)
  "Used when emacsclient is run in a terminal, in a graphical environment."
  (unless (display-graphic-p frame)
    (set-face-background 'default "unspecified-bg" frame)
    (set-face-background 'font-lock-comment-face "unspecified-bg" frame)))

(add-hook 'after-make-frame-functions 'on-frame-open)

;; Cursor
(set-default 'blink-cursor-blinks 0)      ; always blink
(set-default 'blink-cursor-interval 0.25) ; blink faster!
(set-default 'cursor-type 'bar)
