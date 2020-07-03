;; Note: ccls is an Emacs front-end for use with the CCLS program:
;; https://github.com/MaskRay/ccls.


(use-package ccls
  :after lsp-mode
  :config
  (setq ccls-executable "ccls"
        lsp-prefr-flymake nil
        c-default-style "linux"
        c-basic-offset 2
        lsp-enable-indentation nil
        subword-mode 1)
  (c-toggle-auto-newline nil)
  (c-toggle-auto-state 1))


(use-package flycheck-clang-analyzer
  :ensure t
  :after flycheck
  :config (flycheck-clang-analyzer-setup))


;; ToDo - some reading on hooks, this is not how I thought they
;; worked.  The second 'add-hook' will add a hook to the buffer-local
;; before-save-hook.
(add-hook 'c-mode-hook
          (lambda ()
            (add-hook 'before-save-hook
                      (lambda ()
                        ;; quick-fix until I can figure out how
                        ;; to un-fuck makefile-mode and submit a patch.
                        (if (not (eq major-mode 'makefile-gmake-mode))
                            (helper-indent-buffer))))))
