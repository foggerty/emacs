;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Settings that apply to more than one programming mode, and modes
;;;; without much setup required.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)
(add-to-list 'auto-mode-alist '("\\.service\\'" . systemd-mode))

(setq eldoc-echo-area-use-multiline-p 1)
(setq eldoc-idle-delay 0.0)

(global-eldoc-mode)

(use-package aggressive-indent)

(use-package paredit)

(use-package systemd)

(use-package magit
  :bind
  ("C-x g" . magit-status))

(use-package markdown-mode
  :config
  (setq markdown-fontify-code-blocks-natively t))


(use-package git-timemachine
  :bind
  (("C-c t" . git-timemachine-toggle)))

(add-hook 'prog-mode-hook (qif (electric-pair-mode)
                               (show-paren-mode 1)))

(use-package flycheck
  :config
  (setq-default flycheck-disabled-checkers
                '(emacs-lisp-checkdoc))
  (global-flycheck-mode))

(use-package subword
  :config
  (global-subword-mode 1))

(use-package sql-indent
  :hook
  (sql-mode . sqlind-minor-mode))

