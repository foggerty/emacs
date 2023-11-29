;;; This file just sets up package management, makes sure that
;;; use-package in installed, and then everything else is setup via
;;; other scripts.


;; Always use newer source over old byte-compiled.
(setq load-prefer-newer t)


;; Stop Emacs from writing that bloody custom-set-variables stuff.
(setq custom-file "~/.emacs.d/custom-variables.el")


;; Packages setup
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))


;; Required packages for boot-strap
(dolist (package '(diminish))
  (unless (package-installed-p package)
    (package-install package)))


;; Configure use-package
(setq use-package-always-ensure t
      package-user-dir "~/.emacs.d/elpa"
      package--init-file-ensured t)

(unless (file-directory-p package-user-dir)
  (make-directory package-user-dir t))


;; Load global settings and major-mode settings
(setq files-to-load
      '("helpers.el"
        "random-functions.el"
        "theme.el"
        "libraries.el"
        "text-settings.el"
        "global-settings.el"
        "dev-settings.el" ; should come before all other dev-related modes
        "elisp-settings.el"
        "inf-janet.el"
    	"janet-settings.el"
        "c-settings.el"
        "scheme-settings.el"
        "go-settings.el"
        "clojure-settings.el"
        "neo4j-settings.el"
        "ruby-settings.el"
        "yaml-settings.el"
        "elixir-settings.el"
        "python-settings.el"
        "lilypond.el"
        "org-settings.el"
        "global-key-bindings.el"))  ; always run last

(dolist (file files-to-load)
  (load-file (concat (file-name-directory user-init-file)
		               file)))

