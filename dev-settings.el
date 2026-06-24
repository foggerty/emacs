;;; -*- lexical-binding: t; -*-

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Settings that apply to more than one programming mode.
;;;
;;

;; Always keep comments to 80 columns.
(advice-add 'prog-fill-reindent-defun
            :around
            (lambda (original &rest args)
              (let ((original-fill fill-column))
                (setq fill-column 80)
                (apply original args)
                (setq fill-column original-fill))))

;; Code completion
(use-package eglot
  :defer t
  :config
  (fset #'jsonrpc--log-event #'ignore))

(setq read-process-output-max (* 4 1024 1024)) ; lsp read-buffer.
(setq eglot-autoshutdown t
      eglot-report-progress t)

;; EDiff help window doen't play nicely with a tiling window-manager.
(setq ediff-no-emacs-help-in-control-buffer t)

;; Don't render cursors in non-focused windows:
(setq-default cursor-in-non-selected-windows nil)
(setq highlight-nonselected-windows nil)

;; Don't enable globally, it's a pain in text/org mode.
(use-package aggressive-indent
  :hook
  (bash-ts-mode
   css-ts-mode
   elixir-ts-mode
   go-ts-mode
   ielm-mode
   js-ts-mode
   janet-ts-mode
   json-ts-mode
   kdl-mode
   ruby-ts-mode
   emacs-lisp-mode
   nxml-mode))

(require 'aggressive-indent)
(define-key aggressive-indent-mode-map (kbd "C-c C-q") nil)

;; Magit - todo, LEARN!
(use-package magit
  :bind
  ("C-x g" . magit-status))

;; Tardis mode.
(use-package git-timemachine
  :bind
  ("C-c t" . git-timemachine-toggle))

;; Subword mode.
(use-package subword)
(global-subword-mode 1)

;; Automatically make scripts executable.
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

;; Setup eldoc.
(setq eldoc-echo-area-use-multiline-p 1
      eldoc-idle-delay 0.0
      eldoc-help-at-pt t)
(global-eldoc-mode)

;; Hungry-delete: backspace/delete kill up to next char.
(use-package hungry-delete
  :hook
  (bash-ts-mode
   cider-mdoe
   css-ts-mode
   elixir-mode
   elixir-ts-mode
   emacs-lisp-mode
   geiser-mode
   go-ts-mode
   ielm-mode
   kdl-mode
   nxml-mode
   ruby-ts-mode
   janet-ts-mode
   json-ts-mode
   js-ts-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Flymake
;;;
;;

(require 'flymake)
(require 'window)

(setq flymake-indicator-type nil)
(setq flymake-fringe-indicator-position nil)

(flymake-mode)

(defun my/flymake-toggle-buffer ()
  "Toggle flymake disgnostics buffer.  Ripped from here:
https://olddeuteronomy.github.io/post/cpp-programming-in-emacs/"
  (interactive)
  (if (string-search "*Flymake diagnostics" (buffer-name))
      (delete-window)
    (progn
      (flymake-show-buffer-diagnostics)
      (let ((name (flymake--diagnostics-buffer-name)))
        (if (get-buffer name)
            (switch-to-buffer-other-window name)
          (error "No Flymake diagnostics buffer found"))))))

(add-hook 'prog-mode-hook #'flymake-mode)
(global-set-key (kbd "<f7>") 'my/flymake-toggle-buffer)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Smartparens
;;;
;;

(use-package smartparens
  :hook
  ((prog-mode . smartparens-mode))
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Tree-sitter
;;;
;;

(require 'treesit)
(setq treesit-auto-install-grammar t
      treesit-enabled-modes t)

(setq major-mode-remap-alist
      '((sh-mode     . bash-ts-mode)
        (elixir-mode . elixir-ts-mode)
        (ruby-mode   . ruby-ts-mode)
        (json-mode   . json-ts-mode)))
