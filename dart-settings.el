(use-package dart-mode  
  :config
  (company-mode-on)
  (electric-pair-local-mode)
  (add-hook 'dart-mode-hook 'flycheck-mode)
  (setq dart-enable-analysis-server t))
