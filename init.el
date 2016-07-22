(load-file "~/.emacs.d/helpers.el")

;; Required if any of the third party packages are to be
;; called/initialized in this file.
(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; GLobal defaults
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Save desktop on exit
(desktop-save-mode 1)
; Some random comment

;; Extra repositories for packages
(require 'package)
(setq package-archives
      '(("gnu"       . "https://elpa.gnu.org/packages/")
		  ("marmalade" . "https://marmalade-repo.org/packages/")
		  ("melpa"     . "https://melpa.org/packages/")))


;; Ensure the required packages are loaded, and install them if not.
(helper-install-packages
 '(	company
		exec-path-from-shell
		flx
		flx-ido
		paredit
		pkg-info
		powerline
		markdown-mode
		projectile
		move-line
		async
		helm
		helm-company
		helm-flx
		helm-projectile
		helm-anything
		neotree
		smartparens))

;; Smart Parens
(smartparens-global-mode)

;; NeoTree
(global-set-key (kbd "<f8>") 'neotree-toggle)
(setq neo-smart-open t)
(setq projectile-switch-project-action 'neotree-projectile-action)


;; Helm
(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(helm-projectile-on)
(helm-autoresize-mode nil)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match t)


;; Projectile mode everywhere
(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-indexing-method 'alien)
(setq projectile-enable-caching nil)
(global-set-key (kbd "<f12>") 'projectile-find-file)


;; Use the same path you'd get in a standard shell
(exec-path-from-shell-initialize)


;; Appearance tidy ups
(custom-set-variables
 '(inhibit-startup-screen t)
 '(ns-command-modifier (quote meta))
 '(ring-bell-function (quote ignore) t)
 '(tab-width 3))
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(powerline-center-theme)
(load-theme 'tango-dark)
(set-default 'cursor-type 'bar)
(set-default-font "Courier New")
(set-face-attribute 'default nil :height 145)


;; Better (smoother) scrolling
(setq scroll-conservatively 1)
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-scroll-amount (quote (2 ((shift) . 1))))
(setq hscroll-step 1)
(setq truncate-lines 1)
(defun fog-scroll-left ()
  "Scrolls left."
  (interactive)
  (scroll-left 1))
(defun fog-scroll-right ()
  "Scrolls right."
  (interactive)
  (scroll-right 1))
(setq go-left '((kbd "<S-wheel-down>")
					 (kbd "<triple-wheel-right>")
					 (kbd "<double-wheel-right>")
					 (kbd "<wheel-right>")))
(setq go-right '((kbd "<S-wheel-up>")
					  (kbd "<triple-wheel-left>")
					  (kbd "<double-wheel-left>")
					  (kbd "<wheel-left>")))
;; Note to self, we need to eval key-press here because it will be
;; passed to global-set-key as is - i.e. a list.
(dolist (key-press go-left)
  (global-set-key (eval key-press) 'fog-scroll-left))
(dolist (key-press go-right)
  (global-set-key (eval key-press) 'fog-scroll-right))


;; IDO - use flx
(ido-mode t)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil) ; use highlighting from flx


;; Global settings, defaults, and replacements for standard settings
(require 'move-line)
(electric-pair-mode)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "<f2> e") 'flymake-popup-current-error-menu)
(show-paren-mode t)
(setq hippie-expand-try-functions-list
		'(try-expand-dabbrev
		  try-expand-dabbrev-all-buffers
		  try-expand-dabbrev-from-kill
		  try-complete-file-name-partially
		  try-complete-file-name
		  try-expand-all-abbrevs
		  try-expand-list
		  try-expand-line
		  try-complete-lisp-symbol-partially
		  try-complete-lisp-symbol))


;; Help
(define-key 'help-command (kbd "C-l") 'find-library)  ; C-h C-l
(define-key 'help-command (kbd "C-f") 'find-function) ; C-h C-f
(define-key 'help-command (kbd "C-k") 'find-function-on-key) ; C-h C-k


;; Centralised backup directory
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))


;; Replace yes/no with y/n
(defalias 'yes-or-no-p 'y-or-n-p)


;; Gobal auto-complete (Company mode)
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "C-<return>") 'company-complete)
(setq company-idle-delay nil) ;; don't auto show, use key defined above.


;; Spell checking
(setq ispell-program-name "/usr/local/bin/aspell")
(setq ispell-dictionary "british")


;; Flyspell for comments (prog-mode is the parent of all programming
;; hook modes.
(add-hook 'prog-mode-hook
			 (lambda ()
				(flyspell-prog-mode)))
			 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Specific editing modes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load-file "~/.emacs.d/randomFunctions.el")
(load-file "~/.emacs.d/textSettings.el")
(load-file "~/.emacs.d/orgSettings.el")
(load-file "~/.emacs.d/goSettings.el")
(load-file "~/.emacs.d/elispSettings.el")
(load-file "~/.emacs.d/rubySettings.el")
;;(load-file "~/.emacs.d/clojureSettings.el")
;;(load-file "~/.emacs.d/schemeSettings.el")
