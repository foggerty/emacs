;;; My Emacs config file, by Matt Dee, aged 4 1/2 (ish).

;; This file just sets up package management, makes sure that
;; use-package in installed, and then everything else is setup via
;; other scripts.

;; Helpful function to find shadowing packages: list-load-path-shadows


;; Packages setup
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t) 

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; Required packages for boot-strap
(mapcar (lambda (p)
	  (unless (package-installed-p p)
	    (package-install p)))
	'(diminish
	  use-package))

;; Configure use-package
(setq use-package-always-ensure t)

;; Load global settings and major-mode settings
(mapcar (lambda (file)
	  (load (concat "~/.emacs.d/" file)))
	'("theme.el"
	  "helpers.el"
	  "global-settings.el"
	  "dev-settings.el" ; sould come before all other dev related modes
	  "elisp-settings.el" 
	  "scheme-settings.el"
	  "text-settings.el"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (geiser paredit company counsel hungry-delete exec-path-from-shell use-package diminish))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
