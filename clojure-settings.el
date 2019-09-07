(use-package cider
  :config
  (setq cider-allow-jack-in-without-project t)
  (setq cider-inject-dependencies-at-jack-in t)
  (add-hook 'clojure-mode-hook 'paredit-mode))

