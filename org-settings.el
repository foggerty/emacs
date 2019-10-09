;; ORG Mode

(use-package org

  :mode "\\.org\\'"

  :config
  (add-hook 'org-mode-hook 'org-indent-mode)

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
  (add-hook 'org-mode-hook org-bullets-mode)
  :requires org)

(require 'ob-clojure) ; will automatically enable Clojure in Babel.
