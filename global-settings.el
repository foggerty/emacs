;;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Basic tidy ups / tweaks.
;;;
;;

(require 'helpers)

;; Refresh buffers when changed on disk, if there are no edits.
(global-auto-revert-mode 1)

;; Human-readable file sizes in dired.
(setq dired-listing-switches "-a -l -h")

;; Hide minor modes in modeline.
(use-package minions
  :custom
  (minions-mode-line-ligher "--")
  :init
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
(add-hook 'after-save-hook 'delete-trailing-whitespace)

;; Save desktop on exit
(require 'desktop)
(desktop-save-mode 1)
(setq desktop-load-locked-desktop 'check-pid)
(setq desktop-dirname "~/.emacs.d/desktop")

(add-hook 'server-after-make-frame-hook 'desktop-read)

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

;; Hungry-delete: backspace/delete kill up to next char.
(use-package hungry-delete
  :hook
  (emacs-lisp-mode
   bash-mode
   bash-ts-mode
   elixir-mode
   elixir-ts-mode
   ruby-mode
   ruby-ts-mode
   go-mode
   go-ts-mode))

;; LESS cow-bell.
(setq ring-bell-function 'ignore)

;; Stop Emacs from writing that bloody custom-set-variables stuff.
(setq custom-file "~/.emacs.d/custom-variables.el")

;; Copy ENV variables if running as a daemon.
(use-package exec-path-from-shell)
(exec-path-from-shell-initialize)

;; Show less pop-ups when compiling.
(require 'comp-run)
(setq native-comp-async-report-warnings-errors 'silent)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Mini-buffer / Code completion.
;;

;; Code completion
(use-package corfu
  :bind (:map corfu-map
              ("<next>"  . corfu-scroll-up)
              ("<prior>" . corfu-scroll-down))
  :custom
  (corfu-quit-at-boundry t)
  (corfu-quit-no-match nil)
  (corfu-auto nil)
  (corfu-echo-delay 0)
  :init
  (global-corfu-mode)
  (corfu-popupinfo-mode 1)
  (corfu-echo-mode))

(use-package corfu-terminal
  :config
  (unless (display-graphic-p)
    (corfu-terminal-mode +1)))

;; Mini-buffer completion that uses default Emacs completion (see
;; Orderless below)
(use-package vertico
  :custom
  (vertico-scroll-margin 0)
  (vertico-count 10)
  (vertico-resize 'grow-only)
  (vertico-cycle t)
  :init
  (vertico-mode)
  :bind (:map vertico-map
              ("<next>" . vertico-scroll-up)
              ("<prior>" . vertico-scroll-down)))

;; Replaces Emac's default copmletion with Orderless
(use-package orderless
  :custom
  (completion-styles '(orderless flex basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles basic partial-completion))))
  (orderless-component-separator "[ &]"))

;; Use Orderless with Eglot.
(setq completion-category-overrides '((eglot (styles orderless))
                                      (eglot-capf (styles orderless))))

;; Show help text in margin on mini-buffer.
(use-package marginalia
  :init
  (marginalia-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Ripgrep
;;;
;;

(use-package wgrep)

(use-package rg)
(rg-enable-default-bindings)   ; or rg-enable-menu


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Consult - uses ripgrep etc
;;;
;;

(use-package consult)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Projectile - project management
;;;
;;

(use-package projectile
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
              ("<f12>" . 'projectile-command-map)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Mouse settings - one day this will be intuitive...
;;;
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
;;;
;;

(use-package helpful
  :bind
  (("C-h f" . helpful-callable)
   ("C-h v" . helpful-variable)
   ("C-h k" . helpful-key)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Which-key, tell me what to press next
;;;
;;

(require 'which-key)
(setq which-key-idle-delay 0.5)
(which-key-mode t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Treemacs
;;;
;;

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
;;;
;;

(use-package visual-regexp-steroids
  :config
  (advice-add 'replace-regexp-as-diff :override #'vr/query-replace))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Golden-ratio - give active window more space.
;;;
;;

(use-package golden-ratio
  :config
  (golden-ratio-mode 1))
