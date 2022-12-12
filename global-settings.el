;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Basic tidy ups / tweaks.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; GC 'optimization' - will see if it actually makes a noticeable
;;; difference. Maybe it was causing those pauses....
;;; (setq gc-cons-threshold 100000000)

;; Fine, I'll go with spaces :-(
(setq-default indent-tabs-mode nil)


;; File beautification
(setq delete-trailing-lines t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)


;; Use the same path you'd get in a standard shell
(use-package exec-path-from-shell
  :init
  (exec-path-from-shell-initialize))


;; On Mac, use Command key as Meta when not in terminal.
(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta))


;; Save desktop on exit
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
(helper-run-if-found
 "aspell"
 (lambda (path)
   (setq ispell-program-name path
         ispell-dictionary "british")))


;; Hungry-delete: backspace kills all whitespace until it reaches next
;; character.  Don't want it globally enabled however, as it clobbers
;; things like cc-mode's bindings.
(use-package hungry-delete
  :defer t)


;; LESS cow-bell.
(setq ring-bell-function 'ignore)


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
  :bind (("C-s"     . swiper)
         ("C-x C-f" . counsel-find-file)
         ("M-x"     . counsel-M-x)
         ("C-c g"   . counsel-git-grep))
  :diminish ivy-mode)

;; (use-package flx
;;   :config
;;   (setq ivy-re-builders-alist
;;         '((t . ivy--regex-fuzzy))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Company (auto-complete) settings.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package company
  :defer t
  :config
  (add-to-list 'completion-styles 'completion-initials-try-completion t)
  (setq company-idle-delay nil)
  :diminish
  company-mode)

(use-package company-quickhelp
  :defer t
  :config
  (company-quickhelp-mode))

(use-package company-flx)

(use-package company-fuzzy
  :hook (company-mode . company-fuzzy-mode)
  :init
  (setq company-fuzzy-sorting-backend 'flx
        company-fuzzy-prefix-on-top nil
        company-fuzzy-trigger-symbols '("." "->" "<" "\"" "'" "@")))

(use-package company-shell)

(global-company-mode)
(global-company-fuzzy-mode 1)


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
;;;; Mouse settings - one day this will be intuitive...
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq mouse-wheel-tilt-scroll t)
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-scroll-amount '(3 ((shift) . 1)))
(when (not (display-graphic-p))
  (xterm-mouse-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Let me know what to press next....
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package which-key
  :defer t
  :init
  (which-key-mode)
  (which-key-setup-side-window-right-bottom)
  :diminish which-key-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Helpful - better help screens.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package helpful
  :bind
 (("C-h f" . helpful-function)
   ("C-h v" . helpful-variable)
   ("C-h k" . helpful-key)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Magit
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package magit
  :bind
  ("C-x g" . magit-status))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Golden-ratio
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package golden-ratio
  :init
  (golden-ratio-mode)
  :diminish golden-ratio-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; visual-fill-column-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package visual-fill-column
  :defer t)

(defadvice set-fill-column (after refresh-visual-fill-column last activate)
  "Will check if visual-fill-column-mode is active, and adjust
margins if so."
  (visual-fill-column-adjust))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; yasnippet
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package yasnippet
  :defer t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Visual Regexp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package visual-regexp
  :bind
  (("C-r" . #'vr/replace)))

;; ToDo - check out Prodigy - define and then manage bespoke 'services'.
