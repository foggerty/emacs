;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Basic tidy ups.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; On Mac, use Command key as Meta when not in terminal.
(when (and (eq system-type 'darwin)
	   (display-graphic-p))
  (setq mac-command-modifier 'meta))

;; Save desktop on edit
(desktop-save-mode 1)

;; Highlighted region is deleted when typing
(delete-selection-mode 1)

;; Make sure temp buffers don't steal all of the screen
(temp-buffer-resize-mode t)
(setq temp-buffer-max-height 20
      compilation-window-height 20)

;; Centralised backup directory
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; Yes/no to y/n
(defalias 'yes-or-no-p 'y-or-n-p)

;; Use aspell over ispell
(require 'ispell)
(setq ispell-program-name "/usr/local/bin/aspell"
      ispell-dictionary "british")
(show-paren-mode 1)

;; Hungry-delete: backspace kills all whitespace until it eaches next
;; character.
(use-package hungry-delete
  :init
  (global-hungry-delete-mode))

;; LESS cow-bell.
(setq ring-bell-function 'ignore)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; navigation / searching.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package counsel ; will bring in both Ivy and Swiper
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
	ivy-count-format "(%d/%d) ")
  :bind
  (("C-s" . swiper)
   ("C-x C-f" . counsel-find-file)
   ("M-x" . counsel-M-x)
   ("C-h f" . counsel-describe-function)
   ("C-h v" . counsel-describe-variable)
   ("C-c g" . counsel-git-grep)
   ("C-c f" . counsel-projectile-grep))
  :diminish ivy-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Company settings.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package company
  :config
  (setq company-idle-delay 0)
  (add-to-list 'completion-styles 'partial-completion t)
  :diminish company-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Projectile - project management
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package projectile)
(use-package counsel-projectile
  :bind
  ("<f12>" . counsel-projectile-find-file))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Mouse settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Better (smoother) scrolling
(setq scroll-conservatively 1
      mouse-wheel-progressive-speed nil
      mouse-wheel-scroll-amount '(2 ((shift) . 1))
      hscroll-step 1
      truncate-lines 1)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Global key bindings.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-c C-q")	'helper-indent-buffer)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-x C-k") 'helper-kill-buffer)
(global-set-key (kbd "C-x k") (q-funk (kill-buffer (current-buffer))))
(global-set-key (kbd "C-M-=") 'increase-margin)
(global-set-key (kbd "C-M--") 'decrease-margin)
(global-set-key (kbd "C-x C-k") 'other-window-kill-buffer)
(global-set-key (kbd "<s-backspace>") 'kill-to-beginning-of-line)
;;(global-set-key (kbd "C-x 5") ) TODO - q-funk to set margin to 50% of window

