;;; Basic tidy ups
(menu-bar-mode 0)
(tool-bar-mode 0)
(setq inhibit-startup-screen t)
(add-to-list 'default-frame-alist
             '(vertical-scroll-bars . nil)
             '(menu-bar-lines . nil))


;; Set the frame title
(setq-default frame-title-format '("%b"))


;; Window manager stuff
(setq-default )


;;; Make pretty with themes etc.
(use-package ewal-doom-themes
  :ensure t
  :config
  (if (daemonp) ;; doesn't work out of daemon mode in terminal?
      (load-theme 'ewal-doom-one t)
    (load-theme 'wombat)))

;;(load-theme 'tango-dark)

(setq-default line-spacing 2) ; 1 extra pixel under lines

(defun after-frame-create (frame)
  (with-selected-frame frame
    (set-frame-parameter frame 'undecoraded 1)
    (set-frame-parameter frame 'alpha-background 0.90)
    (helper-set-font '("Source Code Pro-12"))))

(add-hook 'after-make-frame-functions #'after-frame-create)


;;; Cursor
(set-default 'blink-cursor-blinks 0) ; always blink
(set-default 'blink-cursor-interval 0.25) ; blink faster!
(set-default 'cursor-type 'bar)


;;; Italic comments.
(custom-set-faces
 '(font-lock-comment-face ((t (:foreground "#a0a2a5" :slant italic)))))


;;;; Smooth scrolling (GUI only)
(pixel-scroll-precision-mode)
