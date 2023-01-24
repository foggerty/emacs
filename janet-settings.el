(use-package janet-mode)

(load-from-init  "inf-janet.el")

;;  (setq inf-janet-program "~/janet/build/janet")
;;    or
;;  (setq inf-janet-program '("localhost" . 5555))

(setq inf-janet-program (shell-command-to-string "which janet"))

(add-hook 'janet-mode-hook #'inf-janet-minor-mode)
(add-hook 'janet-mode-hook #'paredit-mode)
(add-hook 'janet-mode-hook #'aggressive-indent-mode)
