(use-package dart-mode
  :after (company)

  :hook
  (dart-mode . electric-pair-local-mode)
  (dart-mode . lsp)
  (dart-mode . foggerty-flutters)

  :config
  (setq dart-format-on-save t
        dart-sdk-path "~/Development/flutter/bin/cache/dart-sdk/")

  (with-eval-after-load "projectile"
    (add-to-list 'projectile-project-root-files-bottom-up "pubspec.yaml")
    (add-to-list 'projectile-project-root-files-bottom-up "BUILD")))

(use-package yaml-mode)
