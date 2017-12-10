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
   `(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
   `(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 50)))))
   `(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
   `(company-tooltip-common ((t (:inherit font-lock-constant-face))))))

;; Cursor
(set-default 'cursor-type 'bar)

;; Fonts/faces
(helper-set-font '("Source code pro light" "Monaco"))
(set-face-attribute 'default nil
		    :height 145)
