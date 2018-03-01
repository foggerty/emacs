;;; My Emacs config file, by Matt Dee, aged 4 1/2 (ish).


;;; This file just sets up package management, makes sure that
;;; use-package in installed, and then everything else is setup via
;;; other scripts.


;; Stop Emacs from writing that bloody custom-set-variables stuff.
(setq custom-file (make-temp-file "emacs-custom"))


;; Packages setup
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("org" . "https://orgmode.org/elpa/") t)

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))


;; Required packages for boot-strap
(setq boot-strap-packages
      '(diminish
	use-package))

(dolist (package boot-strap-packages)
  (unless (package-installed-p package)
    (package-install package)))


;; Configure use-package
(setq use-package-always-ensure t)


;; Use the same path you'd get in a standard shell
(use-package exec-path-from-shell
  :init 
  (exec-path-from-shell-initialize))


;; Load global settings and major-mode settings
(setq setup--the-rest
      '("helpers.el"
	"global-settings.el"
	"dev-settings.el" ; sould come before all other dev related modes
	"elisp-settings.el" 
	"scheme-settings.el"
	"ruby-settings.el"
	"text-settings.el"
	"org-settings.el"
	"theme.el"))

(dolist (file setup--the-rest)
  (load (concat "~/.emacs.d/" file)))
