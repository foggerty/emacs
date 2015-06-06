;; Clojure mode

;; Ensure the required packages are loaded, and install them if not.
(helper-install-packages '(cider
									clojure-mode
									clojurescript-mode)

(add-hook 'cider-mode-hook #'eldoc-mode)
(setq cider-repl-result-prefix "> ")
