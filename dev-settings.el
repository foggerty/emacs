;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Settings that apply to more than one programming mode, and modes
;;;; without much setup required.
;;

(require 'eglot)

(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)
(add-to-list 'auto-mode-alist '("\\.service\\'" . systemd-mode))

(global-eldoc-mode)
(setq eldoc-echo-area-use-multiline-p 1)
(setq eldoc-idle-delay 0.0)

(use-package smartparens
  :hook
  (prog-mode)
  :config
  (require 'smartparens-config)
  :bind (
         :map emacs-lisp-mode-map
         (";"                 . sp-comment)

         :map smartparens-mode-map
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

(use-package aggressive-indent)

(use-package systemd)

(use-package yaml-mode)

(use-package magit
  :bind
  ("C-x g" . magit-status))

(use-package markdown-mode
  :config
  (setq markdown-fontify-code-blocks-natively t))

(use-package git-timemachine
  :bind
  ("C-c t" . git-timemachine-toggle))

(use-package flycheck
  :config
  (setq-default flycheck-disabled-checkers
                '(emacs-lisp-checkdoc))
  (global-flycheck-mode))

(use-package subword
  :config
  (global-subword-mode 1))

(use-package sql-indent
  :hook
  (sql-mode . sqlind-minor-mode))

(use-package hyprlang-ts-mode
  :custom
  (hyprlang-ts-mode-indent-offset 4))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Tree-sitter
;;

(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :hook
  (shel-mode-hook . bash-ts-mode)
  :config
  (setq treesit-auto-langs
        '(bash
          c
          clojure
          elixir
          go
          gomod
          hyprlang
          json
          ruby
          sql)))

(add-to-list 'treesit-language-source-alist
             '(hyprlang "https://github.com/tree-sitter-grammars/tree-sitter-hyprlang"))

(require 'treesit-auto)

(treesit-auto-add-to-auto-mode-alist 'all)
(treesit-auto-install-all)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Completion.
;;

(use-package corfu
  :bind (:map corfu-map
              ("<next>"  . corfu-scroll-up)
              ("<prior>" . corfu-scroll-down))
  :init
  (setq corfu-quit-at-boundry t
        corfu-quit-no-match nil
        corfu-auto nil
        corfu-echo-delay 0)
  (global-corfu-mode)
  (corfu-popupinfo-mode 1)
  (corfu-echo-mode))

(use-package corfu-terminal
  :config
  (unless (display-graphic-p)
    (corfu-terminal-mode +1)))

(use-package fussy
  :config
  (fussy-setup)
  (fussy-eglot-setup))

;; For cache functionality.
(advice-add 'corfu--capf-wrapper :before 'fussy-wipe-cache)

(add-hook 'corfu-mode-hook
          (lambda ()
            (setq-local fussy-max-candidate-limit 5000
                        fussy-default-regex-fn 'fussy-pattern-first-letter
                        fussy-prefer-prefix nil)))
