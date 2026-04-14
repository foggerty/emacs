;;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Helpers
;;;
;;

(defun on-frame-open (&optional _)
  "Used when emacsclient is run in a terminal, in a graphical environment."
  (if (not (display-graphic-p))
      (progn
        (set-face-background 'default "unspecified-bg" (selected-frame))
        (set-face-background 'font-lock-comment-face "unspecified-bg" (selected-frame)))
    (set-frame-font "SauceCodePro Nerd Font Mono-13" nil t t)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Basic tidy ups
;;;
;;

(require 'helpers)

(menu-bar-mode 0)
(tool-bar-mode 0)
(fringe-mode '(0 . 0))

(scroll-bar-mode 0)
(set-window-scroll-bars (minibuffer-window) 0 'none nil nil t)

(setq inhibit-startup-screen t)
(setq-default frame-title-format '("%b"))
(setq-default line-spacing 3) ; 3 extra pixels under lines

(add-to-alist 'default-frame-alist
              `((drag-internal-border . 1)
                (internal-border-width . 5)))

;; Corfu's popup isn't detected as such by hyprland, so turn off transparency
;; because it's not being blurred.
(add-hook 'server-after-make-frame-hook
          #'(lambda ()
              (let ((alpha (if (frame-parent) 0.0 0.65)))
                (modify-frame-parameters nil `((alpha-background . ,alpha)))
                (on-frame-open))))
(add-hook 'server-after-make-frame-hook #'on-frame-open)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Make pretty with themes etc.
;;;
;;

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'doom-wallust-dark t)

;; (use-package ewal-spacemacs-themes)
;; (load-theme 'ewal-spacemacs-classic t)

;; Cursor
(set-default 'blink-cursor-blinks 0)      ; always blink
(set-default 'blink-cursor-interval 0.25) ; blink faster!
(set-default 'cursor-type 'bar)
