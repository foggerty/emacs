(use-package dart-mode  
  :hook
  (dart-mode . flycheck-mode)
  (dart-mode . electric-pair-local-mode)

  :config
  (setq dart-enable-analysis-server t))