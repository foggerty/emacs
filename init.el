;; Required if any of the third party packages are to be
;; called/initialized in this file.
(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; GLobal defaults
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Extra repositories for packages
(require 'package)
(setq package-archives
      '(("gnu"       . "http://elpa.gnu.org/packages/")
		  ("marmalade" . "http://marmalade-repo.org/packages/")
		  ("melpa"     . "http://melpa.milkbox.net/packages/")))

;; Ensure the required packages are loaded, and install them if not.
(setq required-packages
		'(cider 
		  clojure-mode
		  clojurescript-mode
		  company
		  company-go
		  exec-path-from-shell
		  flx
		  flx-ido
		  go-mode
		  paredit
		  pkg-info
		  powerline
		  markdown-mode))

(unless package-archive-contents
  (package-refresh-contents))

(dolist (p required-packages)
  (unless (package-installed-p p)
	 (package-install p)))

;; Use the same path you'd get in a standard shell
(exec-path-from-shell-initialize)

;; Appearance tidy ups
(custom-set-variables
 '(inhibit-startup-message t)
 '(scroll-conservatively 1)
 '(mouse-wheel-scroll-amount '(2 ((shift) . 1)))
 '(mouse-wheel-progressive-speed nil)
 '(ring-bell-function 'ignore)
 '(tab-width 3))
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(load-theme 'tango-dark)
(display-time)
(powerline-center-theme)
(set-default 'cursor-type 'bar)
(set-default-font "Source Code Pro Light")
(set-face-attribute 'default nil :height 140 :weight 'light :width 'normal)
(set-face-bold-p 'bold nil) 
(dolist (f (face-list))
  (if (face-bold-p f)
		(set-face-bold f nil)))

;; IDO mode
(custom-set-variables
 '(ido-enable-flex-matching t)
 '(ido-everywhere t))
(ido-mode t)

;; Global editing defaults
(custom-set-variables
 '(ns-command-modifier 'meta))
(show-paren-mode t)
(global-set-key (kbd "RET") 'newline-and-indent)

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
(if (display-graphic-p)
	 (progn
		(require 'color)
		(let ((bg (face-attribute 'default :background)))
		  (custom-set-faces
			`(company-tooltip ((t (:inherit default :background ,(color-lighten-name bg 2)))))
			`(company-scrollbar-bg ((t (:background ,(color-lighten-name bg 10)))))
			`(company-scrollbar-fg ((t (:background ,(color-lighten-name bg 5)))))
			`(company-tooltip-selection ((t (:inherit font-lock-function-name-face))))
			`(company-tooltip-common ((t (:inherit font-lock-constant-face))))))))

;; Location of ispell binary
(setq ispell-program-name "/usr/local/bin/ispell")

;; Flyspell for comments (prog-mode is the parent
;; of all programming hook modes.)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Specific editing modes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load-file "~/.emacs.d/textSettings.el")
(load-file "~/.emacs.d/goSettings.el")
(load-file "~/.emacs.d/orgSettings.el")
(load-file "~/.emacs.d/clojureSettings.el")
