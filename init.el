;;; My Emacs config file, by Matt Dee, aged 4 1/2 (ish).

;; This file just sets up package management, makes sure that
;; use-install in installed, and then everything else is setup via
;; other scripts.

;; Helpful function to find shadowing packages: list-load-path-shadows

;; Packages setup
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t) 

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(setq use-package-always-ensure t)

;; All config is loaded from ~/.emacs.d
(add-to-list 'load-path "/users/matt/.emacs.d")

(load "theme.el")
(load "global-settings.el")
(load "scheme-settings.el")



















(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (paredit paredit-mode geiser guile counsel ivy exec-path-from-shell flycheck flyckeck use-package atom-one-dark-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
