;;; Basic tidy ups
(setq inhibit-startup-screen t)
(setq tool-bar-mode nil)
(when (display-graphic-p) (fringe-mode 0))
(add-to-list 'default-frame-alist
             '(vertical-scroll-bars . nil)
             '(menu-bar-lines . nil))

(toggle-menu-bar-mode-from-frame 0)


;;; Highlighting
(when (display-graphic-p)
  (progn
    (use-package highlight-parentheses
      :init
      (highlight-parentheses-mode))
    (use-package highlight-quoted
      :init
      (highlight-quoted-mode))))


;;; Beacon - show where the cursor is after scrolling.
(use-package beacon
  :config
  (beacon-mode 1))


;;; OS Specific config - OSX
(setq osx-specific-config
      '(progn
         (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
         (setq frame-title-format '(" "))
         (setq icon-title-format '(""))))

(when (eq 'ns (window-system))
  (eval osx-specific-config))


;; Make pretty
(require 'color)

(custom-set-variables '(custom-safe-themes t))

(if (display-graphic-p)
    (progn
      (load-file "~/.emacs.d/tangotango2-theme.el")
      (load-theme 'tangotango2)))


;;; Cursor
(set-default 'blink-cursor-blinks 0) ; always blink
(set-default 'blink-cursor-interval 0.3) ; blink faster!
(set-default 'cursor-type 'bar)


;;; Powerline - ToDo: customise colors (can add to Tango theme?)
(use-package powerline
  :config
  (powerline-default-theme))


;;; Fonts/faces
(when (display-graphic-p)
  (helper-set-font '("Source Code Pro"))
  (set-face-attribute 'default nil
                      :height 100))
