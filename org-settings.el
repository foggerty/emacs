;; ORG Mode

(require 'org)
(require 'ob-clojure)

(use-package org-bullets)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(setq org-todo-keywords
      '((sequence "TODO(t)" "IN PROGRESS(p)" "BLOCKED(b)" "DONE(d)")))

(setq org-tag-alist '(("Code" . ?c)
                      ("Organising" . ?o)
                      ("Work" . ?w)
                      ("Rennovation" . ?r)))

;; Note to self: (require 'ob-clojure) will automatically enable
;; Clojure for Babel.  Also, emacs-lisp is enabled by default.

(org-babel-do-load-languages
 'org-babel-load-languages
 '((scheme . t)))

(setq org-src-fontify-natively 1
      org-hide-emphasis-markers t
      org-export-coding-system 'utf-8
      org-list-description-max-indent 5
      org-use-sub-superscripts '{}
      org-special-ctrl-a/e t
      org-special-ctrl-k t
      org-edit-src-content-indentation 0
      org-src-tab-acts-natively t
      org-confirm-babel-evaluate nil
      org-support-shift-select 'always
      org-src-fontify-natively t
      org-babel-clojure-backend 'cider)

(defun my-org-mode ()
  (require 'ox-md nil t)

  (org-indent-mode 1)
  (org-bullets-mode 1)
  (org-toggle-pretty-entities)
  (auto-fill-mode nil)
  (visual-fill-column-mode 1)

  (local-set-key (kbd "C-c C-a") 'org-agenda)
  (local-set-key (kbd "C-<up>") 'org-backward-heading-same-level)
  (local-set-key (kbd "C-<down>") 'org-forward-heading-same-level)
  (local-set-key (kbd "<f5>") 'foggerty-map-maori-vowel)
  (local-set-key (kbd "C-c t") 'set-org-tags-from-anywhere)

  ;; HACK!  This is to allow for quotes to be used inside verbatim
  ;; tags.  What's happening here is that the variable
  ;; org-emphasis-regexp-components holds five 'parts' each of which
  ;; defines a regex-ish thing.  Seriously, I have no idea if these
  ;; are actual regex's or not.  We're updating the third 'thing',
  ;; which lists the characters that are forbidden either immediately
  ;; after, or immediately before the verbatim/emphasis tags.
  (setcar (nthcdr 2 org-emphasis-regexp-components) " \t\r\n")
  (org-set-emph-re 'org-emphasis-regexp-components org-emphasis-regexp-components))

(add-hook 'org-mode-hook 'my-org-mode)
