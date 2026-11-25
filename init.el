;;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Copy user shell preferences (i.e. Bash settings).
;;;
;;

;;(use-package exec-path-from-shell)
;;(exec-path-from-shell-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Package setup
;;;
;;

(require 'package)
(require 'use-package-ensure)

(setq load-prefer-newer t
      use-package-always-ensure t
      use-package-always-defer t
      package-native-compile t)

(make-directory package-user-dir t)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Custom config loading
;;;
;;

(add-to-list 'load-path
             (expand-file-name "~/.emacs.d/user-lisp"))

(let ((files-to-load
       '(
         "config/global-settings.el"
         "config/theme.el"
         "config/completion-settings.el"
         "config/dev-settings.el" ; should come before all other dev modes.
         "config/misc-dev-settings.el"
         "config/odin-settings.el"
         "config/clojure-settings.el"
         "config/text-settings.el"
         "config/elisp-settings.el"
         "config/c-plus-settings.el"
         "config/go-settings.el"
         "config/neo4j-settings.el"
         "config/ruby-settings.el"
         "config/elixir-settings.el"
         "config/janet-settings.el"
         "config/org-settings.el"
         "config/global-key-bindings.el" ; always run last
         )))

  (dolist (file files-to-load)
    (load-file (concat (file-name-directory user-init-file)
                       file))))
