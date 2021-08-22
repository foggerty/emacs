;;; My Emacs config file, by Matt Dee, aged 4 1/2 (ish).


;;; This file just sets up package management, makes sure that
;;; use-package in installed, and then everything else is setup via
;;; other scripts.

(load-theme 'wombat)


;; Always use newer source over old byte-compiled.
(setq load-prefer-newer t)


;; Stop Emacs from writing that bloody custom-set-variables stuff.
(setq custom-file "/dev/null")


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
(dolist (package '(diminish use-package))
  (unless (package-installed-p package)
    (package-install package)))


;; Configure use-package
(setq use-package-always-ensure t
      package-user-dir "~/.emacs.d/elpa"
      package--init-file-ensured t)

(unless (file-directory-p package-user-dir)
  (make-directory package-user-dir t))


;; Load global settings and major-mode settings
(setq setup-the-rest
      '("helpers.el"
        "random-functions.el"
        "theme.el"
        "global-settings.el"
        "dev-settings.el" ; should come before all other dev related modes
        "elisp-settings.el"
        "text-settings.el"
;;        "org-settings.el"
        "global-key-bindings.el"))  ; always run last

(let ((init-dir (file-name-directory user-init-file)))
  (dolist (file setup-the-rest)
    (load (concat init-dir file))))
