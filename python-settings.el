(use-package python
  :config
  ;; Remove guess indent python message
  (setq python-indent-guess-indent-offset-verbose nil))

(add-hook 'python-mode-hook 'eglot-ensure)
