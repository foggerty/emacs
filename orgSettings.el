;; ORG Mode

(require 'org)

(helper-install-packages '(org-bullets))

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(setq org-todo-keywords
      '((sequence "TODO" "IN PROGRESS" "BLOCKED" "DONE")))

(defun my-org-mode ()
  (org-indent-mode)
  (setq org-hide-emphasis-markers t)
  (local-set-key (kbd "C-<up>") 'outline-previous-visible-heading)
  (local-set-key (kbd "C-<down>") 'outline-next-visible-heading)
  (setq org-src-fontify-natively 1)
  (org-bullets-mode 1)
  (org-toggle-pretty-entities)
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
