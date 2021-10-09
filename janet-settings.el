(let ((init-dir (file-name-directory user-init-file)))
  (load (concat init-dir "inf-janet.el")))

(require 'inf-janet)

(setq inf-janet-program (shell-command-to-string "which janet"))

;;    or, to attach to existing repl:
;;    (setq inf-janet-program '("localhost" . 5555))

(add-hook 'janet-mode-hook #'inf-janet-minor-mode)
