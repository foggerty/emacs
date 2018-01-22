;;; My Emacs config file, by Matt Dee, aged 4 1/2 (ish).

;; This file just sets up package management, makes sure that
;; use-package in installed, and then everything else is setup via
;; other scripts.

;; Helpful function to find shadowing packages: list-load-path-shadows

;; Stop Emacs from writing that bloody custom-set-variables stuff.
(setq custom-file (make-temp-file "emacs-custom"))

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
;;(setq use-package-always-ensure t)

;; Load global settings and major-mode settings
(mapcar (lambda (file)
	  (load (concat "~/.emacs.d/" file)))
	'("helpers.el"
	  "global-settings.el"
	  "dev-settings.el" ; sould come before all other dev related modes
	  "elisp-settings.el" 
	  "scheme-settings.el"
	  "text-settings.el"
	  "org-settings.el"
	  "theme.el")) ; theme may be setting variables defined in ther packages, always call last

