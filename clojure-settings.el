(use-package cider
  :bind
  (:map cider-mode-map
        ("C-c C-b" . cider-load-buffer))
  :config
  (setq cider-allow-jack-in-without-project t
        cider-inject-dependencies-at-jack-in t
        cider-repl-display-help-banner nil
        cider-repl-pop-to-buffer-on-connect 'display-only))

(use-package flycheck-clj-kondo)

(use-package clojure-mode
  :config
  (require 'flycheck-clj-kondo))
