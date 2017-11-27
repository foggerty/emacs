;;; Basic tidy up
(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;; Theme
(use-package atom-one-dark-theme
  :ensure t
  :config (load-theme 'atom-one-dark :no-comfirm))

(set-default 'cursor-type 'bar)
