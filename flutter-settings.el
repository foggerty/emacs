(use-package dart-mode
  :after (company)

  :hook
  (dart-mode . electric-pair-local-mode)

  :config
  (setq dart-format-on-save t
        dart-sdk-path "~/Development/flutter/bin/cache/dart-sdk/")

  (with-eval-after-load "projectile"
    (add-to-list 'projectile-project-root-files-bottom-up "pubspec.yaml")
    (add-to-list 'projectile-project-root-files-bottom-up "BUILD")))

(use-package yaml-mode)

;; I'm using eglot elsewhere, but the lsp-dart package wants lsp-mode

(use-package lsp-mode
  :ensure t)

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-doc-enable nil
        lsp-ui-doc-max-width 80
        lsp-ui-doc-use-webkit t
        lsp-ui-doc-position 'top))

(use-package lsp-treemacs)

(use-package lsp-dart
  :ensure t
  :hook
  (dart-mode . lsp)
  :config
  (setq lsp-dart-sdk-dir "/opt/flutter/bin/cache/dart-sdk/"
        lsp-dart-flutter-sdk-dir "/opt/flutter"
        lsp-))
