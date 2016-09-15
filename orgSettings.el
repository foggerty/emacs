;; ORG Mode

(require 'org)

(helper-install-packages '(org-bullets))

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(setq org-todo-keywords
      '((sequence "TODO(t)" "IN PROGRESS(p)" "BLOCKED(b)" "DONE(d)")))

(setq org-tag-alist '(("ADD" . ?a)
											("Code" . ?c)
											("Meditation" . ?t)
											("Mood" . ?m)
											("Organising" . ?o)
											("Work" . ?w)
											("Rennovation" . ?r)
											("Upskilling" . ?u)))


(defun my-org-mode ()
	(require 'ox-md nil t)

	(org-indent-mode)
	(org-bullets-mode 1)
	(org-toggle-pretty-entities)

	(setq org-src-fontify-natively 1)
	(setq org-hide-emphasis-markers t)

	(local-set-key (kbd "C-c C-a") 'org-agenda)
	(local-set-key (kbd "C-<up>") 'outline-previous-visible-heading)
	(local-set-key (kbd "C-<down>") 'outline-next-visible-heading)
	(local-set-key (kbd "<f5>") 'map-maori-vowel)
	(local-set-key (kbd "C-<tab>") 'other-window)
	(local-set-key (kbd "C-c t") 'set-org-tags-from-anywhere)

	;; HACK!  This is to allow for quotes to be used inside verbatim
	;; tags.  What's happening here is that the variable
	;; org-emphasis-regexp-components holds five 'parts' each of which
	;; defines a regex-ish thing.  Seriously, I have no idea if these
	;; are actual regex's or not.  We're updating the third 'thing',
	;; which lists the characters that are forbidden either immediately
	;; after, or immediately before the verbatim/emphasis tags.
	(setcar (nthcdr 2 org-emphasis-regexp-components) " \t\r\n")
	(org-set-emph-re 'org-emphasis-regexp-components org-emphasis-regexp-components)

	;; Org journal
	(setq org-journal-dir "~/Google Drive/Documents/Journal Entries"))

(helper-add-hook 'org-mode-hook 'my-org-mode)
