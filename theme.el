;;; -*- lexical-binding: t; -*-

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

(set-default 'blink-cursor-blinks 0)      ; always blink
(set-default 'blink-cursor-interval 0.25) ; blink faster!
(set-default 'cursor-type 'bar)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;
;;;
;;

(use-package doom-modeline
  :init
  (doom-modeline-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Make pretty with themes etc.
;;;
;;

(add-to-list 'default-frame-alist
             '(font . "SauceCodePro Nerd Font Mono-13"))

;; Alpha values are set in the theme template, so evaluate file to reset it.
(load-file (concat (file-name-directory user-init-file)
		           "themes/"
                   "doom-wallust-dark.el"))

;; This is where it starts to go wrong....

(modify-all-frames-parameters '((alpha-background . 68)))

(add-to-list 'custom-theme-load-path "/home/matt/.emacs.d/themes")
(load-theme 'tangotango2 t)
;;(load-theme 'doom-wallust-dark t)

;; (defun on-frame-open (&optional _)
;;   "Used when emacsclient is run in a terminal, in a graphical environment."
;;   (if (not (display-graphic-p))
;;       (progn
;;         (let ((alpha (if (frame-parent) 0.0 0.6)))
;;           (modify-frame-parameters nil `((alpha-background . ,alpha))))
;;         (set-face-background 'default "unspecified-bg" (selected-frame))
;;         (set-face-background 'font-lock-comment-face "unspecified-bg" (selected-frame)))
;;     (set-frame-font "SauceCodePro Nerd Font Mono-13" nil t t)))

;; (add-hook 'server-after-make-frame-hook #'on-frame-open)
