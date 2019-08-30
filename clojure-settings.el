(use-package cider
  :config
  (setq cider-allow-jack-in-without-project t)
  (add-hook 'clojure-mode-hook 'paredit-mode))

(use-package paredit
  :hook clojure-mode)
