;; Make sure temp buffers don't steal all of the screen
(temp-buffer-resize-mode t)
(setq temp-buffer-max-height 20
      compilation-window-height 20)


;;; Basic tidy ups
(setq inhibit-startup-screen t)

(menu-bar-mode -1)
(tool-bar-mode -1)


;;; Highlighting
(use-package highlight-parentheses
  :init
  (highlight-parentheses-mode))

(use-package highlight-quoted
  :init
  (highlight-quoted-mode))


;; Beacon - show where the cursor is after scrolling.
(use-package beacon
  :config
  (beacon-mode 1))


;; Cursor
(set-default 'blink-cursor-blinks 0) ; always blink
(set-default 'blink-cursor-interval 0.3) ; blink faster!
(set-default 'cursor-type 'bar)


;; Theme
(load-theme 'wombat)
