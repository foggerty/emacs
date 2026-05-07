;;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Basic tidy ups
;;;
;;

(require 'helpers)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

;; (set-window-scroll-bars (minibuffer-window) 0 'none nil nil t)

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
;;;; Mood Line
;;;
;;

(use-package mood-line
  :init
  (mood-line-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Make pretty with themes etc.
;;;
;;

(add-to-list 'custom-theme-load-path
             "/home/matt/.emacs.d/themes")

(modify-all-frames-parameters
 '((font . "SauceCodePro Nerd Font Mono-13")
   (alpha-background . 0.68)))

(use-package ewal-doom-themes)
(setq ewal-doom-one-padded-modeline 1
      ewal-doom-one-brighter-modeline 1)
(load-theme 'ewal-doom-one t)

;; (load-theme 'tangotango2 t)

(defun on-frame-open (&optional _)
  "Background is 'tricky' when mixing/matching graphical and TTY clients."
  (progn
    (if (display-graphic-p)
        (let ((alpha (if (frame-parent) 0.0 0.68)))
          (modify-frame-parameters nil `((alpha-background . ,alpha))))
      (progn
        (set-face-background 'default "unspecified-bg" (selected-frame))
        (set-face-background 'font-lock-comment-face "unspecified-bg" (selected-frame))))))

(add-hook 'server-after-make-frame-hook #'on-frame-open)
