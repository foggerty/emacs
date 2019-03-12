q;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Basic tidy ups / tweaks.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Use the same path you'd get in a standard shell
(use-package exec-path-from-shell
  :init 
  (exec-path-from-shell-initialize))


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

(let ((aspell (executable-find "aspell")))
  (if aspell
      (setq ispell-program-name aspell
				ispell-dictionary "british")))


;; Hungry-delete: backspace kills all whitespace until it reaches next
;; character.
(use-package hungry-delete
  :init
  (global-hungry-delete-mode))


;; LESS cow-bell.
(setq ring-bell-function 'ignore)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; More helpful help.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package helpful
  :bind (("C-h f" . helpful-function)
			("C-h v" . helpful-variable)
			("C-h k" . helpful-key)))

(use-package which-key)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; navigation / searching.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package counsel ; will bring in both Ivy and Swiper
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
        ivy-count-format "(%d/%d) "
        ivy-initial-inputs-alist nil
        ivy-use-selectable-prompt t)
  :bind (("C-s" . swiper)
			("C-x C-f" . counsel-find-file)
			("M-x"     . counsel-M-x)
			("C-c g"   . counsel-git-grep)
			("C-c f"   . counsel-projectile-grep))
  :diminish ivy-mode)


(use-package flx
  :config
  (setq ivy-re-builders-alist
        '((t . ivy--regex-plus))))


;; Treemacs - treeview that hooks into Projectile.
(use-package treemacs)
;;(use-package treeemacs-icons-dired)
(use-package treemacs-magit)
(use-package treemacs-projectile
  :requires projectile)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Company (auto-complete) settings.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package company
  :config
  (add-to-list 'completion-styles 'completion-initials-try-completion t)
  (setq company-idle-delay 0)

  :diminish
  company-mode)

;;(use-package company-flx)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Projectile - project management
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package projectile)
(use-package counsel-projectile
  :config
  (add-hook 'after-init-hook 'counsel-projectile-mode)
  (setq projectile-use-git-grep t)
  :bind
  ("<f12>" . counsel-projectile-find-file))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Mouse settings - Yay 26.1!
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq mouse-wheel-tilt-scroll t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Let me know what to press next....
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package which-key
  :init
  (which-key-mode)
  (which-key-setup-side-window-right-bottom))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Global key bindings.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-c C-q")	'helper-indent-buffer)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-x C-k") 'foggerty-other-window-kill-buffer)
(global-set-key (kbd "C-x k") (q-funk (kill-buffer (current-buffer))))
(global-set-key (kbd "C-M-=") 'increase-margin)
(global-set-key (kbd "C-M--") 'decrease-margin)
(global-set-key (kbd "C-x C-k") 'other-window-kill-buffer)
(global-set-key (kbd "<s-backspace>") 'kill-to-beginning-of-line)
(global-set-key (kbd "M-_") 'decrease-font-size)
(global-set-key (kbd "M-+") 'increase-font-size)
(global-set-key (kbd "<M-S-backspace>") 'foggerty-kill-to-beginning-of-line)
(global-set-key (kbd "<f8>") 'treemacs)
