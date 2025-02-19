;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Settings that apply to more than one programming mode, and modes
;;;; without much setup required.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

(use-package aggressive-indent)
(use-package markdown-mode)
(use-package paredit)

(use-package git-timemachine
  :bind
  (("C-c t" . git-timemachine-toggle)))

(add-hook 'prog-mode-hook (qif (diminish 'paredit-mode)
                               (diminish 'eldoc-mode)
                               (electric-pair-mode)
                               (show-paren-mode 1)))

(setq eldoc-echo-area-use-multiline-p 1)
