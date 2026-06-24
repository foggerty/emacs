;;; -*- lexical-binding: t; -*-

;;; Code:

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
;;;; Optimise native-code compiling
;;;
;;

;; (setq native-comp-compiler-options
;;       `("-O2 -mtune=native -march=native"
;;         ;; Reduce .eln size and compilation overhead.
;;         "-g0"
;;         ;; Good defensive choice for Emacs stability.
;;         "-fno-omit-frame-pointer"
;;         "-fno-finite-math-only")

;;       native-comp-driver-options
;;       `(;; -Wl,-z,pack-relative-relocs compresses
;;         ;; relocation tables to reduce file size and
;;         ;; slightly improve load times.
;;         "-Wl,-z,pack-relative-relocs"
;;         ;; -Wl,-O2 applies standard linker-level
;;         ;; optimizations (like string merging) to the
;;         ;; generated shared object.
;;         "-Wl,-O2"
;;         ;; -Wl,--as-needed prevents the linker from
;;         ;; recording dependencies on libraries that
;;         ;; are not actually used by the code.
;;         "-Wl,--as-needed"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Custom config loading
;;;
;;

(add-to-list 'load-path
             (expand-file-name "~/.emacs.d/lisp"))

(let ((files-to-load
       '(
         "theme.el"
	 "global-settings.el"
	 "consult.el"
         "dev-settings.el" ; should come before all other dev modes.
         "misc-dev-settings.el"
         "clojure-settings.el"
         "text-settings.el"
         "elisp-settings.el"
         "c-settings.el"
         "c-plus-settings.el"
         ;; "go-settings.el"
         ;; "neo4j-settings.el"
         "ruby-settings.el"
         ;; "elixir-settings.el"
         ;; "janet-settings.el"
         "org-settings.el"
         "lisp/random-functions.el"
         "lisp/helpers.el"
         "global-key-bindings.el"
         )))

  (dolist (file files-to-load)
    (load-file (concat (file-name-directory user-init-file)
                       file))))

(use-package emacs
  :custom
  (enable-recursive-minibuffers t)
  (read-extended-command-predicate #'command-completion-default-include-p)
  (minibuffer-prompt-properties
   '(read-only t cusror-intangible t face minibuffer-prompt)))
