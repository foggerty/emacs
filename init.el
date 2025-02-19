;;; This file just sets up package management, everything else is
;;; setup via other scripts.


(require 'package)
(require 'use-package-ensure)

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(setq load-prefer-newer t
      use-package-always-ensure t
      use-package-always-defer t
      package-user-dir "~/.emacs.d/packages")

(make-directory package-user-dir t)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;;(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

;; Required packages for boot-strap.
(dolist (package '(diminish
                   exec-path-from-shell))
  (unless (package-installed-p package)
    (package-install package)))


(setq files-to-load
      '("helpers.el"
        "random-functions.el"
        ;"tangotango2-theme.el"
        "theme.el"
        "libraries.el"
        "text-settings.el"
        "global-settings.el"
        "dev-settings.el" ; should come before all other dev modes.
        "elisp-settings.el"
        "janet-settings.el"
        "c-settings.el"
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
