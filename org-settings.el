;;; -*- lexical-binding: t; -*-

(use-package org
  :custom
  (org-confirm-babel-evaluate nil)
  (org-edit-src-content-indentation 0)
  (org-hide-emphasis-markers t)
  (org-hide-leading-stars t)
  (org-special-ctrl-a/e t)
  (org-special-ctrl-k t)
  (org-src-tab-acts-natively t)
  (org-support-shift-select t)
  (org-todo-keywords '((sequence "TODO(t)" "IN PROGRESS(p)" "BLOCKED(b)" "DONE(d)")))
  (org-src-fontify-natively t))

(use-package org-modern)

(require 'org-indent)

(defun org-setup ()
  (org-indent-mode)
  (org-modern-mode)
  (local-set-key (kbd "C-<up>")   'org-backward-heading-same-level)
  (local-set-key (kbd "C-<down>") 'org-forward-heading-same-level)
  (local-set-key (kbd "C-c t")    'set-org-tags-from-anywhere))


(add-hook 'org-mode-hook 'org-setup)
