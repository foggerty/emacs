;; ToDo - some reading on hooks, this is not how I thought they
;; worked.  The second 'add-hook' will add a hook to the buffer-local
;; before-save-hook.
(add-hook 'c-mode-hook
          (lambda ()
            (add-hook 'before-save-hook
                      (lambda ()
                        ;; quick-fix until I can figure out how
                        ;; to un-fuck makefile-mode and submit a patch.
                        (if (not (eq major-mode 'makefile-gmake-mode))
                            (helper-indent-buffer))))))

(add-hook 'c-mode-hook 'eglot-ensure)
(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
