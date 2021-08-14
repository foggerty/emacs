;;; Basic tidy ups
(setq inhibit-startup-screen t)

(menu-bar-mode -1)
(tool-bar-mode -1)


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


;; Theme
(require 'color)

(let ((bg (face-attribute 'default :background)))
  (custom-set-faces
   `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 10)))))
   `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 50)))))
   `(company-scrollbar-fg ((t (:foreground ,(color-lighten-name bg 10)))))
   `(company-tooltip-selection ((t (:inherit font-lock-string-face))))
   `(company-tooltip-common ((t (:inherit font-lock-constant-face))))))


;; Powerline - ToDo: customise colors (can add to Tango theme?)
(use-package powerline
  :config
  (powerline-center-theme))

;; Cursor
(set-default 'blink-cursor-blinks 0) ; always blink
(set-default 'blink-cursor-interval 0.3) ; blink faster!
(set-default 'cursor-type 'bar)


;; Theme
(load-theme 'wombat)
