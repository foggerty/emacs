;; Note: ccls is an Emacs front-end for use with the CCLS program:
;; https://github.com/MaskRay/ccls.

(use-package ccls
  :defer t
  :after lsp-mode
  :config
  (setq ccls-executable "ccls"
        lsp-prefer-flymake nil
        c-default-style "linux"
        c-basic-offset 2
        lsp-enable-indentation nil)
  (c-toggle-auto-newline nil)
  (c-toggle-auto-state 1))

(use-package flycheck-clang-analyzer
  :defer t
  :after flycheck
  :config (flycheck-clang-analyzer-setup))
