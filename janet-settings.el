(use-package janet-ts-mode
  :vc (:url "https://github.com/sogaiu/janet-ts-mode"
            :rev :newest))

(use-package flycheck-janet
  :vc (:url "https://github.com/sogaiu/flycheck-janet"
            :rev :newest))

(use-package ajrepl
  :vc (:url "https://github.com/sogaiu/ajrepl"
            :rev :newest))

(require 'janet-ts-mode)
(require 'flycheck-janet)
(require 'ajrepl)

(setq auto-mode-alist
      (append '(("\\.janet\\'" . janet-ts-mode))
              auto-mode-alist))

(add-hook 'janet-ts-mode-hook #'janet-ts-load-helpers)
(add-hook 'janet-ts-mode-hook #'ajrepl-interaction-mode)
