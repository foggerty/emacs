;; ORG Mode

(use-package org)
(use-package org-bullets)

(defun org-setup ()
  (org-indent-mode)
  (org-bullets-mode)
  (variable-pitch-mode)
  (local-set-key (kbd "C-<up>")   'org-backward-heading-same-level)
  (local-set-key (kbd "C-<down>") 'org-forward-heading-same-level)
  (local-set-key (kbd "C-c t")    'set-org-tags-from-anywhere))

(setq org-babel-clojure-backend 'cider
      org-confirm-babel-evaluate nil
      org-edit-src-content-indentation 0
      org-export-coding-system 'utf-8
      org-hide-emphasis-markers t
      org-list-description-max-indent 5
      org-special-ctrl-a/e t
      org-special-ctrl-k t
      org-src-tab-acts-natively t
      org-support-shift-select t
      org-todo-keywords '((sequence "TODO(t)" "IN PROGRESS(p)" "BLOCKED(b)" "DONE(d)"))
      org-src-fontify-natively t)

(add-hook 'org-mode-hook 'org-setup)
