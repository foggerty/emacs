;;; Make pretty with the help of pywal.
(custom-set-variables '(custom-safe-themes t))

(use-package ewal-doom-themes)


;;; This starts to get messy when you want this config to work with
;;; text, gui and daemon.....
(menu-bar-mode 0)
(tool-bar-mode 0)
(load-theme 'ewal-doom-one)

(defun after-frame-create (frame)
  (with-selected-frame frame
    (toggle-menu-bar-mode-from-frame 0)
    (toggle-tool-bar-mode-from-frame 0)
    (when (display-graphic-p)
      (set-frame-parameter (selected-frame) 'alpha-background 0.8)
      (helper-set-font '("Sauce Code Pro Nerd Font"))
      (set-face-attribute 'default nil
                          :height 120))))

(add-hook 'after-make-frame-functions #'after-frame-create)


;;; Basic tidy ups
(setq inhibit-startup-screen t)
(add-to-list 'default-frame-alist
             '(vertical-scroll-bars . nil)
             '(menu-bar-lines . nil))


;;; Cursor
(set-default 'blink-cursor-blinks 0) ; always blink
(set-default 'blink-cursor-interval 0.25) ; blink faster!
(set-default 'cursor-type 'bar)
