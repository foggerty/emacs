;;; My Emacs config file, by Matt Dee, aged 4 1/2 (ish).


;;; This file just sets up package management, makes sure that
;;; use-package in installed, and then everything else is setup via
;;; other scripts.


;; Stop Emacs from writing that bloody custom-set-variables stuff.
;;(setq custom-file (make-temp-file "emacs-custom"))


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
	"random-functions.el"
	"global-settings.el"
	"dev-settings.el" ; sould come before all other dev related modes
	"elisp-settings.el" 
	"scheme-settings.el"
	"ruby-settings.el"
	"text-settings.el"
	"org-settings.el"
	"dart-settings.el"
	"theme.el"))

(dolist (file setup--the-rest)
  (load (concat "~/.emacs.d/" file)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(org-agenda-files (quote ("~/Google Drive/Development/Linux.org")))
 '(package-selected-packages
   (quote
    (yasnippet use-package spaceline smart-mode-line-powerline-theme rvm ruby-electric robe paredit org-bullets neotree moe-theme hungry-delete go-mode geiser exec-path-from-shell enh-ruby-mode diminish dart-mode counsel-projectile company-flx beacon aggressive-indent))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-scrollbar-bg ((t (:background "#9d369d3694fa"))))
 '(company-scrollbar-fg ((t (:foreground "#34b934b930ab"))))
 '(company-tooltip ((t (:inherit default :background "#34b934b930ab"))))
 '(company-tooltip-common ((t (:inherit font-lock-constant-face))))
 '(company-tooltip-selection ((t (:inherit font-lock-string-face)))))
