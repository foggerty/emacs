;;; -*- lexical-binding: t; -*-

;;; This file just sets up package management, everything else is
;;; setup via other scripts.


(require 'package)
(require 'use-package-ensure)

(setq load-prefer-newer t
      use-package-always-ensure t
      use-package-always-defer t)

(make-directory package-user-dir t)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(use-package diminish)

(setq files-to-load
      '("helpers.el"
        "random-functions.el"
        ;;"tangotango2-theme.el"
        "theme.el"
        "text-settings.el"
        "global-settings.el"
        "dev-settings.el" ; should come before all other dev modes.
        "elisp-settings.el"
        ;;"janet-settings.el"
        "c-settings.el"
        ;;"go-settings.el"
        ;;"clojure-settings.el"
        "neo4j-settings.el"
        "ruby-settings.el"
        "elixir-settings.el"
        ;;"python-settings.el"
        ;;"lilypond.el"
        "org-settings.el"
        "global-key-bindings.el"))  ; always run last

(dolist (file files-to-load)
  (load-file (concat (file-name-directory user-init-file)
                     file)))
