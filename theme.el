;;; Basic tidy ups
(menu-bar-mode 0)
(tool-bar-mode 0)

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


(global-set-font '("Source Code Pro-12"
                   "Liberation Mono-12"
                   "Consolas-12"
                   "Monospace"
                   "Courier New-12"))

;; ToDo - set propertional fonts in org-mode and text-mode.
;; (let ((mono-spaced-font "Source Code Pro")
;;       (proportionately-spaced-font "Cantarell"))
;;   (set-face-attribute 'default nil :family mono-spaced-font :height 120)
;;   (set-face-attribute 'fixed-pitch nil :family mono-spaced-font :height 1.2)
;;   (set-face-attribute 'variable-pitch nil :family proportionately-spaced-font :height 1.2))


;;; Make pretty with themes etc.
(use-package ewal-spacemacs-themes
  :config
  (cond ((or (daemonp) (display-graphic-p))
         (load-theme 'ewal-spacemacs-classic t))
        (t (load-theme 'wombat)))) ; combat-wombat

;;; Cursor
(set-default 'blink-cursor-blinks 0) ; always blink
(set-default 'blink-cursor-interval 0.25) ; blink faster!
(set-default 'cursor-type 'bar)


;;; Italic comments.
(custom-set-faces
 '(font-lock-comment-face ((t (:slant italic)))))


;;;; Smooth scrolling (GUI only)
(pixel-scroll-precision-mode)
