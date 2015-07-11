(load-file "~/.emacs.d/helpers.el")

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
(helper-install-packages '(afternoon-theme
									company
									exec-path-from-shell
									flx
									flx-ido
									paredit
									pkg-info
									powerline
									markdown-mode))

;; Use the same path you'd get in a standard shell
(exec-path-from-shell-initialize)

;; Appearance tidy ups
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
	(quote
	 ("28ec8ccf6190f6a73812df9bc91df54ce1d6132f18b4c8fcc85d45298569eb53"
	  "cedd3b4295ac0a41ef48376e16b4745c25fa8e7b4f706173083f16d5792bb379"
	  "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default)))
 '(ido-enable-flex-matching t)
 '(ido-everywhere t)
 '(inhibit-startup-screen t)
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-scroll-amount (quote (2 ((shift) . 1))))
 '(ns-command-modifier (quote meta))
 '(ring-bell-function (quote ignore) t)
 '(scroll-conservatively 1)
 '(tab-width 3))
(menu-bar-mode -1)
(tool-bar-mode -1)
(load-theme 'afternoon)
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

(ido-mode t)

;; Global editing defaults

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
(load-file "~/.emacs.d/orgSettings.el")
;;(load-file "~/.emacs.d/goSettings.el")
;;(load-file "~/.emacs.d/clojureSettings.el")
(load-file "~/.emacs.d/schemeSettings.el")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-scrollbar-bg ((t (:background "#2b2f45"))))
 '(company-scrollbar-fg ((t (:background "#212435"))))
 '(company-tooltip ((t (:inherit default :background "#1b1e2c"))))
 '(company-tooltip-common ((t (:inherit font-lock-constant-face))))
 '(company-tooltip-selection ((t (:inherit font-lock-function-name-face)))))
