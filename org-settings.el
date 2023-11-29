;; ORG Mode

(use-package org-bullets)

(defun org-setup ()
  (org-indent-mode)
  (org-bullets-mode)
  (org-local-bindings)
  (local-set-key (kbd "C-<up>")   'org-backward-heading-same-level)
  (local-set-key (kbd "C-<down>") 'org-forward-heading-same-level)
  (local-set-key (kbd "C-c t")    'set-org-tags-from-anywhere))

(add-hook 'org-mode-hook 'org-setup)

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
      org-support-shift-select t
      org-todo-keywords '((sequence "TODO(t)" "IN PROGRESS(p)" "BLOCKED(b)" "DONE(d)")))
