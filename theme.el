;;; Trusted themes
(custom-set-variables
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default))))


;;; Basic tidy up
(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)


;; Spaceline theme (i.e. the mode-line)
(use-package spaceline
  :config
  (require 'spaceline-config)
  (setq powerline-default-separator 'utf-8)
  (spaceline-emacs-theme))


;; Beacon - show where the cursor is after scrolling.
(use-package beacon
  :config
  (beacon-mode 1))

;; A tree-view on the side of the frame
;; ToDO - close tree once a file is selected to be opened.
(use-package neotree
  :config
  (global-set-key [f8] 'neotree-toggle)
  (setq neo-theme 'ascii)
  (setq neo-smart-open t)
  (setq projectile-switch-project-action 'neotree-projectile-action))


;; Theme
(require 'color)

(load-file "~/.emacs.d/old/tangotango2.el")

(let ((bg (face-attribute 'default :background)))
  (custom-set-faces
   `(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 10)))))
   `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 50)))))
   `(company-scrollbar-fg ((t (:foreground ,(color-lighten-name bg 10)))))
   `(company-tooltip-selection ((t (:inherit font-lock-string-face))))
   `(company-tooltip-common ((t (:inherit font-lock-constant-face))))))


;; Cursor
(set-default 'blink-cursor-blinks 0) ; always blink
(set-default 'blink-cursor-interval 0.3) ; blink faster!
(set-default 'cursor-type 'bar)


;; Fonts/faces
(when (display-graphic-p)
  (helper-set-font '("Source code pro light" "Monaco"))
  (set-face-attribute 'default nil
		      :height 145))
