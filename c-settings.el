(use-package ccls
  :after lsp-mode
  :config
  (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++check c/c++-gcc))
  (setq ccls-executable "ccls"
        lsp-prefer-flymake nil)
  :hook ((c-mode) . (lambda () (require 'ccls)
                      (lsp))))
;; ToDo - see if can figure out why qif wont work in this context;
;; a macro within a macro probably isn't helping...


