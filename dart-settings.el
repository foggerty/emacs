(use-package dart-mode  
  :config
  (setq dart-enable-analysis-server t)
  (add-hook 'dart-mode-hook 'flycheck-mode))
