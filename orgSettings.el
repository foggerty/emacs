;; ORG Mode

(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(add-hook 'org-mode-hook
	  (lambda ()
;	    (org-indent-mode)
	    (setq org-hide-emphasis-markers f)
		 (local-set-key (kbd "C-<up>") 'outline-previous-visible-heading)
		 (local-set-key (kbd "C-<down>") 'outline-next-visible-heading)))

(setq org-todo-keywords
      '((sequence "TODO" "IN PROGRESS" "BLOCKED" "DONE")))

(setq org-log-done 't)  ;; add timestamp to TODO items when done.
