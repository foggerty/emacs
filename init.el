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

(setq files-to-load
      '("helpers.el"
        "random-functions.el"
        ;;"tangotango2-theme.el"
        "text-settings.el"
        "global-settings.el"
        "theme.el"
        "dev-settings.el" ; should come before all other dev modes.
        "elisp-settings.el"
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

(use-package emacs
  :custom
  (enable-recursive-minibuffers t)
  (read-extended-command-predicate #'command-completion-default-include-p)
  (minibuffer-prompt-properties
   '(read-only t cusror-intangible t face minibuffer-prompt)))
