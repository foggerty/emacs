(use-package ccls
  :after lsp-mode
  :config
  (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++check c/c++-gcc))
  (setq ccls-executable "ccls"
        lsp-prefer-flymake nil
        c-default-style "linux"
        c-basic-offset 2)
  :hook ((c-mode) . (lambda () (require 'ccls)
                      (lsp)
                      (c-toggle-auto-newline 1)
                      (c-toggle-auto-state 1)
                      (subword-mode 1))))
