;;; This file just sets up package management, makes sure that
;;; use-package in installed, and then everything else is setup via
;;; other scripts.


;; Always use newer source over old byte-compiled.
(setq load-prefer-newer t)


;; Stop Emacs from writing that bloody custom-set-variables stuff.
(setq custom-file "/dev/null")


;; Packages setup
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

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
(setq files-to-load
      '("libraries.el"
        "helpers.el"
        "random-functions.el"
        "theme.el"
        "global-settings.el"
        "dev-settings.el" ; should come before all other dev related modes
        "elisp-settings.el"
        "c-settings.el"
        "scheme-settings.el"
        "janet-settings.el"
        "text-settings.el"
        "go-settings.el"
        "clojure-settings.el"
        "lilypond.el"
        "org-settings.el"
        "yaml-settings.el"
        "global-key-bindings.el"))  ; always run last

;; Byte-compile all config (except for this file)
;; to-do surely there's an easier way to tell byte-compile
;; to only compile if newer?
(let ((init-dir (file-name-directory user-init-file)))
  (dolist (file files-to-load)
    (let* ((f (concat init-dir file))
           (f_c (concat (file-name-sans-extension f) ".elc")))
      (load-file f)
      (if (not (file-exists-p f_c))
          (byte-compile-file f)
        (let ((f_t (nth 5 (file-attributes f)))
              (fc_t (nth 5 (file-attributes f_c))))
          (if (time-less-p fc_t f_t)
              (byte-compile-file f)))))))


;; Finally, all of the org files I use.
(setq org-agenda-files '("~/ToDo.org"
                         "~/RandomNotes.org"
                         "~/Development/projects/notebooks"))
