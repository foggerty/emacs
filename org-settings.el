;; ORG Mode

;; Note to self: need to run list-packages, and manually install the
;; newer version from org-mode.org.  Just adding the repo won't force
;; Emacs to download it.

;; Also, if using the more up to date version of Org instead of the
;; pre-packaged one that comes with Emacs, run the below command to
;; recompile all packages that were built against the older version.

;; (byte-recompile-directory package-user-dir nil 'force)

(use-package org

  :config
  (add-hook 'org-mode-hook 'org-indent-mode)

  ;; (require 'org-tempo)  - what was this for?!?

  (setq org-src-fontify-natively t
        org-hide-emphasis-markers t
        org-export-coding-system 'utf-8
        org-list-description-max-indent 5
        org-special-ctrl-a/e t
        org-special-ctrl-k t
        org-edit-src-content-indentation 0
        org-src-tab-acts-natively t
        org-confirm-babel-evaluate nil
        org-babel-clojure-backend 'cider
        org-todo-keywords '((sequence "TODO(t)" "IN PROGRESS(p)" "BLOCKED(b)" "DONE(d)")))

  :bind
  (("C-c C-a" . org-agenda)
   ("C-<up>" . org-backward-heading-same-level)
   ("C-<down>" . org-forward-heading-same-level)
   ("C-c t" . set-org-tags-from-anywhere)))

(use-package org-bullets
  :config
  (add-hook 'org-mode-hook 'org-bullets-mode))

(add-hook 'org-mode-hook (qif (adjust-margins 4)))
