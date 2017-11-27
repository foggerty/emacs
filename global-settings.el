;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Basic tidy ups.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Save desktop on edit
(desktop-save-mode 1)

;; Highlighted region is deleted when typing
(delete-selection-mode 1)

;; Same path you'd get in a shell
(use-package exec-path-from-shell
  :ensure t
  :init (exec-path-from-shell-initialize))

;; Make sure temp buffers don't steal all of the screen
(temp-buffer-resize-mode t)
(setq temp-buffer-max-height 12
      compilation-window-height 12)

;; Centralised backup directory
(setq backup-directory-alist
      '(("." . "~/.emacs.d/backups")))

;; Yes/no to y/n
(defalias 'yes-or-no-p 'y-or-n-p)

;; Use aspell over ispell
(require 'ispell)
(setq ispell-program-name "/usr/local/bin/aspell"
      ispell-dictionary "british")
(show-paren-mode 1)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Navigation / searching.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Going with Ivy, Swiper, and when I learn what it is and does,
;; proably Counsel.  Note to self: use C-o in the minibuffer to get
;; documentation.

(use-package counsel ; will bring in both Ivy and Swiper
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
	ivy-count-format "(%d/%d) ")
  :bind (("C-s" . swiper)))


  
