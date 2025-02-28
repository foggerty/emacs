;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Basic tidy ups / tweaks.
;;

;; Human-readable file sizes in dired.
(setq dired-listing-switches "-a -l -h")

;; Hide minor modes in modeline.
(use-package minions
  :config
  (minions-mode 1))

;; Mouse-mode in terminals
(xterm-mouse-mode)

;; Save location in files.
(save-place-mode 1)

;; Stop Emacs from "jumping" the screen when scrolling, and leave the
;; cursor where it is when scrolling (kinda).
(setq scroll-conservatively 100)
(setq scroll-preserve-screen-position nil)
;; ToDo - use package scroll-restore

;; <tab> will first indent, then complete if hit again.
(setq tab-always-indent 'complete)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; File beautification
(setq delete-trailing-lines t)

;; Save desktop on exit
(require 'desktop)
(desktop-save-mode 1)
(setq desktop-dirname "~/.emacs.d/desktop")

;; Centralised backup directory
(setq backup-directory-alist
      `((".*" . "~/.emacs.d/backups")))
(make-directory "~/.emacs.d/backups" t)

;; Highlighted region is deleted when typing
(delete-selection-mode 1)

;; Yes/no to y/n
(defalias 'yes-or-no-p 'y-or-n-p)

;; Use aspell over ispell
(require 'ispell)
(helper-run-if-found
 "aspell"
 (lambda (path)
   (setq ispell-program-name path
         ispell-dictionary "british")))

;; Hungry-delete: backspace kills all whitespace until it reaches next
;; character.  Don't want it globally enabled however, as it clobbers
;; things like cc-mode's bindings.
(use-package hungry-delete)

;; LESS cow-bell.
(setq ring-bell-function 'ignore)

;; Stop Emacs from writing that bloody custom-set-variables stuff.
(setq custom-file "~/.emacs.d/custom-variables.el")

;; Copy ENV variables if running as a daemon.
(use-package exec-path-from-shell)
(when (daemonp)
  (exec-path-from-shell-initialize))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Show less pop-ups when compiling
;;

(require 'comp-run)
(setq native-comp-async-report-warnings-errors 'silent)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; navigation / searching.
;;

(use-package counsel    
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
        ivy-count-format "(%d/%d) "
        ivy-initial-inputs-alist nil
        ivy-use-selectable-prompt t)
  :bind
  (("C-s"     . swiper)
   ("C-M-s"   . swiper-isearch)
   ("C-r"     . swiper-isearch-backward)
   ("C-x C-f" . counsel-find-file)
   ("M-x"     . counsel-M-x)
   ("C-c g"   . counsel-git-grep)
   :map ivy-minibuffer-map
   (("<next>"  . ivy-scroll-down-command)
    ("<prior>" . ivy-scroll-up-command))))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Projectile - project management
;;;; ToDo - put all projectile bindings behind F12.
;;

(use-package projectile
  :ensure t
  :init
  (projectile-mode +1))

(use-package counsel-projectile
  :config
  (add-hook 'after-init-hook 'counsel-projectile-mode)
  (setq projectile-use-git-grep t)
  :bind
  (("<f12>" . counsel-projectile-find-file)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Mouse settings - one day this will be intuitive...
;;

(require 'pixel-scroll)

(setq mouse-wheel-tilt-scroll t
      mouse-wheel-progressive-speed nil
      mouse-wheel-scroll-amount '(2 ((shift) . 1)))

(setq pixel-scroll-precision-use-momentum t
      pixel-scroll-precision-momentum-seconds 0.75
      pixel-scroll-precision-momentum-tick 0.01
      pixel-scroll-precision-mode t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Helpful - better help screens.
;;

(use-package helpful
  :bind
  (("C-h f" . helpful-callable)
   ("C-h v" . helpful-variable)
   ("C-h k" . helpful-key)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; treemace
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package treemacs
  :config
  (setq treemacs-no-png-images t
        treemacs-tag-follow-delay 0
        treemacs-indent-guide-style 'line
        treemacs-default-visit-action 'treemacs-visit-node-close-treemacs)
  (treemacs-follow-mode)
  (treemacs-fringe-indicator-mode)
  (treemacs-git-mode 'simple)
  (treemacs-filewatch-mode)
  (treemacs-indent-guide-mode)
  :bind
  (("<f8>" . treemacs)))

(use-package treemacs-magit)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Standard regex-replace
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package visual-regexp-steroids
  :config
  (advice-add 'replace-regexp-as-diff :override #'vr/query-replace))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Golden-ratio - give active window more space.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package golden-ratio
  :config
  (golden-ratio-mode))
