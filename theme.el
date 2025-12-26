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
(setq-default line-spacing 2) ; 2 extra pixels under lines

(add-to-alist 'default-frame-alist
              `((drag-internal-border . 1)
                (internal-border-width . 5)))

;; Corfu's popup isn't detected as such by hyprland, so turn off transparency
;; because it's not being blurred.
(add-hook 'server-after-make-frame-hook
          #'(lambda ()
              (let ((alpha (if (frame-parent) 0.0 0.8)))
                (modify-frame-parameters nil `((alpha-background . ,alpha))))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Make pretty with themes etc.
;;;
;;

(use-package ewal-spacemacs-themes)
(load-theme 'ewal-spacemacs-classic t)

;; (load-theme 'tangotango2 t)

(if (or (daemonp) (display-graphic-p))
    (global-set-font '("Sauce Code Pro Nerd Font-13"))
  (set-face-background 'default "unspecified-bg" (selected-frame)))

(defun on-frame-open (&optional _)
  "Used when emacsclient is run in a terminal, in a graphical environment."
  (when (not (display-graphic-p (selected-frame)))
    (set-face-background 'default "unspecified-bg" (selected-frame))
    (set-face-background 'font-lock-comment-face "unspecified-bg" (selected-frame))))

(add-hook 'server-after-make-frame-hook 'on-frame-open)

;; Cursor
(set-default 'blink-cursor-blinks 0)      ; always blink
(set-default 'blink-cursor-interval 0.25) ; blink faster!
(set-default 'cursor-type 'bar)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Font overrides
;;;
;;

(let ((bground (alist-get 'bg1 ewal-spacemacs-themes-colors))
      (fground (alist-get 'border ewal-spacemacs-themes-colors))
      (bar (alist-get 'highlight-dim ewal-spacemacs-themes-colors)))
  (custom-theme-set-faces
   'user
   '(variable-pitch ((t (:family "Cantarell" :width expanded :height 1.0 ))))
   '(fixed-pitch ((t ( :family "Sauce Code Pro Nerd Font" :height 1.0 :inherit 'default))))
   '(font-lock-comment-face ((t (:slant italic :weight semi-bold :background unspecified))))
   '(show-paren-match ((t (:underline nil :foreground "red"))))
   '(org-defult ((t (:inherit variable-pitch))))
   '(org-level-1 ((t (:height 1.0))))
   '(org-level-2 ((t (:height 1.0))))
   '(org-block ((t (:inherit fixed-pitch))))
   '(org-block-begin-line ((t :background unspecified)))
   '(org-block-end-line ((t (:background unspecified))))
   '(org-code ((t (:inherit (shadow fixed-pitch)))))
   '(avy-lead-face ((t (:background unspecified))))
   '(avy-lead-face-0 ((t (:background unspecified))))
   `(scroll-bar ((t (:foreground ,fground :background ,bground))))
   `(corfu-current ((t (:background ,bar))))))
