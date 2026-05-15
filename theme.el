;;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Basic tidy ups
;;;
;;

(require 'helpers)

(menu-bar-mode 0)
(tool-bar-mode 0)
;;(scroll-bar-mode 0)

;; (set-window-scroll-bars (minibuffer-window) 0 'none nil nil t)

(setq inhibit-startup-screen t)
(setq-default frame-title-format '("%b"))
(setq-default line-spacing 0.1)

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
 '(
   (alpha-background . 0.68)))


(use-package ewal-doom-themes)
(setq ewal-doom-one-padded-modeline 4
      ewal-doom-one-brighter-modeline 1)
(load-theme 'ewal-doom-one t)

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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Font customisation
;;;
;;

(custom-theme-set-faces
 'user
 '(variable-pitch ((t (:family "sans"
                               :width expanded
                               :height 1.0 ))))
 '(fixed-pitch ((t (:family "monospace"
                            :height 1.0))))
 '(font-lock-comment-face ((t (:slant italic :weight semi-bold :background unspecified))))
 '(show-paren-match ((t (:underline nil :foreground "red")))))

(use-package org
  :config
  (set-face-attribute 'org-block nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-table nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-indent nil :inherit '(org-hide fixed-pitch))
  (set-face-attribute 'org-level-1 :height 1.0)
  (set-face-attribute 'org-level-2 :height 1.0)
  (set-face-attribute 'org-block :inherit fixed-pitch)
  (set-face-attribute 'org-block-begin-line :background unspecified)
  (set-face-attribute 'org-block-end-line :background unspecified)
  (set-face-attribute 'org-code :inherit (shadow fixed-pitch))
  (set-face-attribute 'avy-lead-face :background unspecified)
  (set-face-attribute 'avy-lead-face-0 :background unspecified))
