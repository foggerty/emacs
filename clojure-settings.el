(require 'ob-clojure) ; will automatically enable Clojure in Babel.

(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)

(use-package cider
  :defer t
  :bind
  (:map cider-mode-map
        ("C-c C-b" . cider-load-buffer)
        ("C-c C-q" . helper-indent-buffer))
  :config
  (setq cider-allow-jack-in-without-project t
        cider-inject-dependencies-at-jack-in t
        cider-repl-display-help-banner nil
        cider-repl-pop-to-buffer-on-connect 'display-only))

(use-package inf-clojure) ; used with babashka

(use-package flycheck-clj-kondo)

(use-package clojure-mode
  :ensure t
  :config
  (require 'flycheck-clj-kondo))
