;;; Basic tidy ups
(setq inhibit-startup-screen t)

(menu-bar-mode -1)

(when (display-graphic-p)
  (progn
    (fringe-mode 0)
    (tool-bar-mode -1)
    (scroll-bar-mode -1)))

;; This looks and works great on a Unix desktop where I can drag and
;; resize windows using modifier keys and a mouse, but on a trackpad
;; it's a no-go.
;;;     (set-frame-parameter nil 'undecorated 1)


;;; Highlighting
(use-package highlight-parentheses
  :init
  (highlight-parentheses-mode))

(use-package highlight-quoted
  :init
  (highlight-quoted-mode))


;; Beacon - show where the cursor is after scrolling.
(use-package beacon
  :config
  (beacon-mode 1))


;; OS Specific config - OSX
(setq osx-specific-config
      '(progn
         (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
         (setq frame-title-format '(" "))
         (setq icon-title-format '(""))))

(when (eq 'ns (window-system))
  (eval osx-specific-config))


;; Theme
(require 'color)
(custom-set-variables '(custom-safe-themes t))
(load-file "~/.emacs.d/tangotango2-theme.el")
(load-theme 'tangotango2)

(let ((bg (face-attribute 'default :background)))
  (custom-set-faces
   `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 10)))))
   `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 50)))))
   `(company-scrollbar-fg ((t (:foreground ,(color-lighten-name bg 10)))))
   `(company-tooltip-selection ((t (:inherit font-lock-constant-face))))
   `(company-tooltip-common ((t (:inherit font-lock-constant-face))))
   `(company-tooltip-annotation ((t (:inherit font-lock-comment-face))))))


;; Powerline - ToDo: customise colors (can add to Tango theme?)
(use-package powerline
  :config
  (powerline-center-theme))


;; Cursor
(set-default 'blink-cursor-blinks 0) ; always blink
(set-default 'blink-cursor-interval 0.3) ; blink faster!
(set-default 'cursor-type 'bar)


;; Fonts/faces
(when (display-graphic-p)
  (helper-set-font '("Source Code Pro"))
  (set-face-attribute 'default nil
                      :height 100))
