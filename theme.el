;;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Basic tidy ups
;;;
;;

(require 'helpers)

(menu-bar-mode 0)
(tool-bar-mode 0)

(setq inhibit-startup-screen t)

(setq-default frame-title-format '("%b"))
(setq-default line-spacing 0.2)

(add-to-alist 'default-frame-alist
              `((drag-internal-border . 1)
                (internal-border-width . 5)
                (alpha-background . 0.75)
                (font . "SauceCodePro Nerd Font Mono-15")))

(set-default 'blink-cursor-blinks 0)      ; always blink
(set-default 'blink-cursor-interval 0.25) ; blink faster!
(set-default 'cursor-type 'bar)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Make pretty with themes etc.
;;;
;;

;; (use-package doom-themes)
;; (setq doom-wallust-dark-padded-modeline 4)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'matugen t)

(defun on-frame-open (&optional _)
  "Background is 'tricky' when mixing/matching graphical and TTY clients."
  (progn
    (if (and (daemonp)
             (not (display-graphic-p)))
        (progn
          (set-face-background 'default "unspecified-bg" (selected-frame))
          (set-face-background 'font-lock-comment-face "unspecified-bg" (selected-frame))))))

(add-hook 'server-after-make-frame-hook #'on-frame-open)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Font customisation
;;;
;;

;; There should be only ONE call to custom-theme-set-faces, so make bloody sure
;; the custom-set-variables file doesn't call it.  FUCK.
(custom-theme-set-faces
 'user
 '(variable-pitch ((t (:family "sans"
                               :width expanded
                               :height 1.0 ))))
 '(fixed-pitch ((t (:family "monospace"
                            :height 1.0))))
 '(font-lock-comment-face ((t (:slant italic :weight semi-bold :background unspecified))))
 '(show-paren-match ((t (:underline nil :foreground "red")))))

(require 'org)
(require 'org-indent)

(set-face-attribute 'mode-line nil :box '(:line-width 2 :color "gray"))

(set-face-attribute 'org-block nil :inherit 'fixed-pitch)
(set-face-attribute 'org-table nil :inherit 'fixed-pitch)
(set-face-attribute 'org-code nil :inherit 'fixed-pitch)
(set-face-attribute 'org-indent nil :inherit '(org-hide fixed-pitch))
(set-face-attribute 'org-level-1 nil :height 1.0)
(set-face-attribute 'org-level-2 nil :height 1.0)
(set-face-attribute 'org-block nil :inherit 'fixed-pitch)
(set-face-attribute 'org-block-begin-line nil :background 'unspecified)
(set-face-attribute 'org-block-end-line nil :background 'unspecified)
(set-face-attribute 'org-code nil :inherit '(shadow fixed-pitch))
