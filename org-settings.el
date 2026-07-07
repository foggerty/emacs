;;; -*- lexical-binding: t; -*-

(use-package org-modern)
(use-package org-bullets)

(require 'org)
(require 'org-indent)

(setq org-confirm-babel-evaluate nil
      org-edit-src-content-indentation 0
      org-hide-emphasis-markers t
      org-hide-leading-stars t
      org-special-ctrl-a/e t
      org-special-ctrl-k t
      org-src-tab-acts-natively t
      org-support-shift-select t
      org-todo-keywords '((sequence "TODO(t)" "IN PROGRESS(p)" "BLOCKED(b)" "DONE(d)"))
      org-src-fontify-natively t)

(add-hook 'org-mode-hook (qif (org-modern-mode)
                              (org-indent-mode)
                              (org-bullets-mode)))
