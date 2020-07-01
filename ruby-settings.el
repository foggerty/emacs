;;(use-package ruby-end)

(use-package ruby-electric
  :hook ruby-mode)

(use-package enh-ruby-mode
  :hook ruby-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode)))

(use-package inf-ruby
  :hook ruby-mode
  :bind (("C-c r r" . inf-ruby)
         ("C-c C-b" . ruby-send-buffer)))

;;; Todo - enh-ruby-mode

;;; todo - get Robe working!  Looks like it isn't designed for one-off
;;; scripts though (which is all I want Ruby for), so maybe not worth
;;; it.
;; (use-package robe
;;   :hook ruby-mode)

;; (use-package rvm)

;; (eval-after-load 'company
;;   '(push 'company-robe company-backends))

(add-hook 'ruby-mode-hook 'flymake-mode)
(add-hook 'ruby-mode-hook 'ruby-electric-mode) ; why is this needed??
