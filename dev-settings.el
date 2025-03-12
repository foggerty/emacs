;;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Settings that apply to more than one programming mode.
;;;
;;

(require 'eglot)

;; Don't enable globally, it's a pain in text/org mode.
(use-package aggressive-indent)

(use-package magit
  :bind
  ("C-x g" . magit-status))

(use-package git-timemachine
  :bind
  ("C-c t" . git-timemachine-toggle))

(use-package flycheck
  :custom
  (flycheck-disabled-checkers
   '(emacs-lisp-checkdoc)))

(global-flycheck-mode)

(use-package subword)

(global-subword-mode 1)

;; Automatically make scripts executable.
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

;; Setup eldoc.
(setq eldoc-echo-area-use-multiline-p 1)
(setq eldoc-idle-delay 0.0)
(global-eldoc-mode)

(use-package smartparens
  :hook
  (prog-mode . smartparens-strict-mode)
  :config
  (require 'smartparens-config)
  :bind (:map smartparens-mode-map
              ("C-M-f"             . sp-forward-sexp)
              ("C-M-b"             . sp-backward-sexp)
              ("C-M-d"             . sp-down-sexp)
              ("C-M-a"             . sp-backward-down-sexp)
              ("M-<up>"            . sp-beginning-of-sexp)
              ("M-<down>"          . sp-end-of-sexp)
              ("C-M-e"             . sp-up-sexp)
              ("C-M-u"             . sp-backward-up-sexp)
              ("C-M-t"             . sp-transpose-sexp)
              ("C-k"               . sp-kill-hybrid-sexp)
              ("C-M-w"             . sp-copy-sexp)
              ("M-<delete>"        . sp-unwrap-sexp)
              ("M-<backspace>"     . sp-backward-unwrap-sexp)
              ("C-S-<right>"       . sp-forward-slurp-sexp)
              ("C-S-<left>"        . sp-forward-barf-sexp)
              ("C-M-<left>"        . sp-backward-slurp-sexp)
              ("C-M-<right>"       . sp-backward-barf-sexp)
              ("M-D"               . sp-splice-sexp)
              ("C-M-<delete>"      . sp-splice-sexp-killing-forward)
              ("C-M-<backspace>"   . sp-splice-sexp-killing-backward)
              ("C-S-<backspace>"   . sp-splice-sexp-killing-around)
              ("C-]"               . sp-select-next-thing-exchange)
              ("C-<left_bracket>"  . sp-select-previous-thing)
              ("C-M-]"             . sp-select-next-thing)
              ("M-F"               . sp-forward-symbol)
              ("M-B"               . sp-backward-symbol)
              ("C-\""              . sp-changeinner)
              ("M-i"               . sp-change-enclosing)))

(require 'smartparens)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Tree-sitter
;;;
;;

(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  (treesit-auto-langs
   '(bash
     c
     cpp
     clojure
     elixir
     go
     gomod
     heex
     hyprlang
     javascript
     json
     ruby
     sql))
  :hook
  (shel-mode-hook . bash-ts-mode)
  :config)

(require 'treesit)

(add-to-list 'treesit-language-source-alist
             '(hyprlang "https://github.com/tree-sitter-grammars/tree-sitter-hyprlang"))

(require 'treesit-auto)

(treesit-auto-add-to-auto-mode-alist 'all)
(treesit-auto-install-all)
