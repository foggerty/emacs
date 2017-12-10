;;; Basic tidy up
(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;; Theme
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
