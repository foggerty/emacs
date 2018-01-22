;; Settings that apply to all programming modes.
;; ToDo - wrap in use-package

(use-package paredit)

(use-package aggressive-indent)

(defun foggerty-dev-mode ()
  (company-mode-on)
  (flyspell-prog-mode)
  (diminish 'paredit-mode)
  (diminish 'eldoc-mode))

(add-hook 'prog-mode-hook 'foggerty-dev-mode)

;; Various Lisp modes - to do, try out parinfer.
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
