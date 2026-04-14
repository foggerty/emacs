(use-package cider
  :defer t
  :hook
  (clojure-mode
   clojure-ts-mode)
  :config
  (cider-prefered-build-tool . lein)
  (cider-font-lock-dynamically '(macro core function var)))

(use-package flycheck-clj-kondo
  :defer t
  :hook
  (clojure-mode
   clojure-ts-mode))
