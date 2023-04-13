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

(helper-set-font '("Sauce Code Pro Nerd Font"))
(setq-default line-spacing 1) ; 1 extra pixel under lines

(defun after-frame-create (frame)
  (with-selected-frame frame
    (set-frame-parameter (selected-frame) 'alpha-background 0.9)))

(add-hook 'after-make-frame-functions #'after-frame-create)


;;; Cursor
(set-default 'blink-cursor-blinks 0) ; always blink
(set-default 'blink-cursor-interval 0.25) ; blink faster!
(set-default 'cursor-type 'bar)
