;; ToDo - set default frame
(setq default-frame-alist '((alpha-background . 0.8)))


;;; Basic tidy ups
(setq inhibit-startup-screen t)
(setq tool-bar-mode nil)

(add-to-list 'default-frame-alist
             '(vertical-scroll-bars . nil)
             '(menu-bar-lines . nil))

(toggle-menu-bar-mode-from-frame 0)


;;; Beacon - show where the cursor is after scrolling.
(use-package beacon
  :config
  (beacon-mode 1))


;;; Make pretty with the help of pywal.
(custom-set-variables '(custom-safe-themes t))
(use-package ewal-spacemacs-themes)
(load-theme 'ewal-spacemacs-classic)


;;; Cursor
(set-default 'blink-cursor-blinks 0) ; always blink
(set-default 'blink-cursor-interval 0.25) ; blink faster!
(set-default 'cursor-type 'bar)


;;; Fonts/faces
(helper-set-font '("Saurce Code Pro Nerd Font"))
(set-face-attribute 'default nil
                    :height 120)
