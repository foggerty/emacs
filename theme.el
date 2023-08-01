;;; Basic tidy ups
(menu-bar-mode 0)
(tool-bar-mode 0)
(setq inhibit-startup-screen t)
(add-to-list 'default-frame-alist
             '(vertical-scroll-bars . nil)
             '(menu-bar-lines . nil))


;; Set the frame title
(setq-default frame-title-format '("%b"))


;;; Make pretty with themes etc.
(use-package ewal-doom-themes
  :ensure t
  :config
  (load-theme 'ewal-doom-one t))

;;(load-theme 'tango-dark)

(setq-default line-spacing 2) ; 1 extra pixel under lines

(defun after-frame-create (frame)
  (with-selected-frame frame
    (set-frame-parameter frame 'alpha-background 0.85)
    (helper-set-font '("Source Code Pro-12"))))

(add-hook 'after-make-frame-functions #'after-frame-create)


;;; Cursor
(set-default 'blink-cursor-blinks 0) ; always blink
(set-default 'blink-cursor-interval 0.25) ; blink faster!
(set-default 'cursor-type 'bar)


;;; Italic comments.
(custom-set-faces
 '(font-lock-comment-face ((t (:foreground "#a0a2a5" :slant italic)))))


;; Sexy(ish) scrolling
(pixel-scroll-precision-mode t) 
(setq pixel-scroll-precision-use-momentum t
      pixel-scroll-precision-momentum-seconds 0.75
      pixel-scroll-precision-momentum-tick 0.01)
