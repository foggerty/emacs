;;; Make pretty with the help of pywal.
(custom-set-variables '(custom-safe-themes t))

(use-package ewal-spacemacs-themes)


;;; This starts to get messy when you want this config to work with
;;; text, gui and daemon......
(add-hook 'after-make-frame-functions
	       (progn
            (toggle-menu-bar-mode-from-frame 0)
            (toggle-tool-bar-mode-from-frame 0)
            (load-theme 'ewal-spacemacs-classic))
	       (when (display-graphic-p)
	         (helper-set-font '("Sauce Code Pro Nerd Font"))
            (set-frame-parameter nil 'alpha-background 0.8)
            (set-face-attribute 'default nil
                                :height 120)))


;;; Basic tidy ups
(setq inhibit-startup-screen t)
(add-to-list 'default-frame-alist
             '(vertical-scroll-bars . nil)
             '(menu-bar-lines . nil))


;;; Beacon - show where the cursor is after scrolling.
(use-package beacon
  :config
  (beacon-mode 1))


;;; Cursor
(set-default 'blink-cursor-blinks 0) ; always blink
(set-default 'blink-cursor-interval 0.25) ; blink faster!
(set-default 'cursor-type 'bar)
