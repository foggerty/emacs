;;; Basic tidy ups
(menu-bar-mode 0)
(tool-bar-mode 0)
(setq inhibit-startup-screen t)
(add-to-list 'default-frame-alist '(vertical-scroll-bars . nil))
(add-to-list 'default-frame-alist '(menu-bar-lines . nil))
(add-to-list 'default-frame-alist '(undecorated . t))
(add-to-list 'default-frame-alist '(drag-internal-border . 1))
(add-to-list 'default-frame-alist '(internal-border-width . 5))


;;; Set the frame title
(setq-default frame-title-format '("%b"))


;;; Make pretty with themes etc.
(use-package ewal-doom-themes)
(load-theme 'ewal-doom-one t)

(use-package spaceline
  :config
  (require 'spaceline-config)
  (spaceline-emacs-theme))


;;; Line spacing
(setq-default line-spacing 3) ; 1 extra pixel under lines


;;; Default for new frames
(defun after-frame-create (frame)
  (with-selected-frame frame
    (set-frame-parameter frame 'undecoraded 1)
    (set-frame-parameter frame 'alpha-background 0.9))
  (helper-set-font '("Source Code Pro-12")))

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
