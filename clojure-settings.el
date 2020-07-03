(use-package cider
  :defer t
  :config
  (setq cider-allow-jack-in-without-project t
        cider-inject-dependencies-at-jack-in t
        cider-repl-display-help-banner nil
        cider-repl-pop-to-buffer-on-connect 'display-only)
  (add-hook 'clojure-mode-hook 'paredit-mode))

(require 'ob-clojure) ; will automatically enable Clojure in Babel.

(add-hook 'cider-repl-mode-hook 'paredit-mode)
