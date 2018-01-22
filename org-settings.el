(use-package org
  :hook (org-mode)
  :commands (org
             org-capture
             org-mode
             org-store-link
             update-org-hours
             my-term-agenda
             dired-notes
             jump-to-org-agenda)
  :bind (("C-c C-a" . 'org-agenda)
	 ("C-<up>" . 'outline-previous-visible-heading)
	 ("C-<down>" . 'outline-next-visible-heading)
	 ("<f5>" . 'map-maori-vowel)
	 ("C-<tab>" . 'other-window)
	 ("C-c t" . 'set-org-tags-from-anywhere)
         ("C-c c" . org-capture))
  :custom
  (org-journal-dir "~/Google Drive/Documents/Journal Entries")
  (org-src-fontify-natively 1)
  (org-hide-emphasis-markers t)
  (org-export-coding-system 'utf-8)
  (org-list-description-max-indent 5)
  (org-todo-keywords '((sequence
			"TODO(t)"
			"IN PROGRESS(p)"
			"BLOCKED(b)"
			"DONE(d)")))
  (org-tag-alist '(("Code" . ?c)
		   ("Organising" . ?o)
		   ("Work" . ?w)
		   ("Rennovation" . ?r)))
  (org-capture-templates '(("j" "Journal entry"
			    entry (file+datetree "~/Google Drive/Documents/Journal Entries/journal.org")
			    "* %?")
			   ("c" "CBT"
			    entry (file+datetree "~/Google Drive/Documents/Journal Entries/cbt.org")
			    "* What happened: %?\n\n%[~/Google Drive/Documents/Journal Entries/cbtTemplate.txt]")))
  :config
  (use-package org-bullets)
  (org-indent-mode)
  (org-bullets-mode)
  (org-toggle-pretty-entities)
  :diminish
  org-indent-mode)
