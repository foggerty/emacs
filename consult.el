(use-package consult
  :bind (
         ("C-o"     . consult-outline)
         ("C-s"     . consult-line)

         ("C-x b"   . consult-buffer)
         ("C-x p b" . consult-project-buffer)

         ("C-c g"   . consult-git-grep)
         ("C-c m"   . consult-mode-command)

         ("M-g g"   . consult-goto-line)
         ("M-g M-g" . consult-goto-line)
         ("M-g e"   . consult-compile-error)

         ("M-y"     . consult-yank-pop))

  ;; Enable automatic preview at point in the *Completions* buffer. This is
  ;; relevant when you use the default completion UI.
  :hook
  (completion-list-mode . consult-preview-at-point-mode)

  ;; The :init configuration is always executed (Not lazy)
  :init

  ;; Use Consult to select xref locations with preview
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)

  :config

  (consult-customize
   consult-theme :preview-key '(:debounce 0.0 any)
   consult-ripgrep consult-git-grep consult-grep consult-man
   consult-bookmark consult-recent-file consult-xref
   consult--source-bookmark consult--source-file-register
   consult--source-recent-file consult--source-project-recent-file
   ;; :preview-key "M-."
   :preview-key '(:debounce 0.4 any))

  ;; Optionally configure the narrowing key.
  ;; Both < and C-+ work reasonably well.
  (setq consult-narrow-key "<"))

(use-package consult-projectile)
