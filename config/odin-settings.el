;;; -*- lexical-binding: t; -*-

;; (package-vc-install
;;  '(odin-mode :url "https://github.com/mattt-b/odin-mode.git"))

;; (package-vc-install
;;  '(odin-ts-mode :url "https://github.com/Sampie159/odin-ts-mode.git"))

;; Add OLS to the list of available programs
;; NOTE: As of Emacs 30, this is not needed.
(with-eval-after-load 'eglot
  (add-to-list 'eglot-server-programs '((odin-mode odin-ts-mode) . ("ols"))))

;; Add a hook to autostart OLS
(add-hook 'odin-mode-hook #'eglot-ensure)
(add-hook 'odin-ts-mode-hook #'eglot-ensure) ;; If you're using the TS mode
