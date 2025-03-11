;;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Package setup
;;;
;;

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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Custom config loading
;;;
;;

(add-to-list 'load-path
             (expand-file-name "~/.emacs.d/lisp"))

(let ((files-to-load
       '("global-settings.el"
         "consult.el"
         "tangotango2-theme.el"
         "theme.el"
         "consult.el"
         "dev-settings.el" ; should come before all other dev modes.
         "misc-dev-settings.el"
         "text-settings.el"
         "elisp-settings.el"
         "c-settings.el"
         "neo4j-settings.el"
         "ruby-settings.el"
         "elixir-settings.el"
         "org-settings.el"
         "global-key-bindings.el"))) ; always comes last

  (dolist (file files-to-load)
    (load-file (concat (file-name-directory user-init-file)
                       file))))
