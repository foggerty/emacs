(use-package elpy)
(use-package pyenv-mode)

(add-hook 'python-mode-hook 'eglot-ensure)
