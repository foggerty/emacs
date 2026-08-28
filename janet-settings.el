;; -*- lexical-binding: t; -*-

(use-package janet-ts-mode
  :vc (:url "https://github.com/sogaiu/janet-ts-mode"
            :rev :newest))

(use-package ajrepl
  :vc (:url "https://github.com/sogaiu/ajrepl"
            :rev :newest))

(require 'janet-ts-mode)
(require 'ajrepl)

(add-hook 'janet-ts-mode-hook #'janet-ts-load-helpers)
(add-hook 'janet-ts-mode-hook #'ajrepl-interaction-mode)
