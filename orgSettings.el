;; ORG Mode

(require 'org)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(setq org-todo-keywords
      '((sequence "TODO" "IN PROGRESS" "BLOCKED" "DONE")))

(defun my-org-mode ()
  (org-indent-mode)
  (setq org-hide-emphasis-markers t)
  (local-set-key (kbd "C-<up>") 'outline-previous-visible-heading)
  (local-set-key (kbd "C-<down>") 'outline-next-visible-heading))

(add-hook 'org-mode-hook 'my-org-mode)
