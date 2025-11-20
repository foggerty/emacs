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



;; Code completion etc.
(require 'eglot)

(setq eglot-autoshutdown t
      eglot-report-progress t)

;; Don't enable globally, it's a pain in text/org mode.
(use-package aggressive-indent
  :hook
  (bash-ts-mode
   css-ts-mode
   elixir-mode
   elixir-ts-mode
   geiser-mode
   go-ts-mode
   js-ts-mode
   janet-ts-mode
   json-ts-mode
   ielm-mode
   ruby-ts-mode
   ruby-electric-mode
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
(setq eldoc-echo-area-use-multiline-p 1)
(setq eldoc-idle-delay 0.0)
(global-eldoc-mode)

;; Hungry-delete: backspace/delete kill up to next char.
(use-package hungry-delete
  :hook
  (bash-ts-mode
   css-ts-mode
   elixir-mode
   elixir-ts-mode
   emacs-lisp-mode
   geiser-mode
   go-ts-mode
   ielm-mode
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
;;;; IMenu-List
;;;
;;

(use-package imenu-list
  :config
  (setq imenu-list-focus-after-activation t
        imenu-use-popup-menu t)
  (add-hook 'imenu-after-jump-hook #'imenu-list-smart-toggle)
  (global-set-key (kbd "C-/") #'imenu-list-smart-toggle))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Smartparens
;;;
;;

(use-package smartparens
  :hook
  (bash-ts-mode
   elixir-mode
   elixir-ts-mode
   emacs-lisp-mode
   geiser-mode
   go-ts-mode
   janet-ts-mode
   json-ts-mode
   nxml-mode
   ruby-ts-mode)
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

(require 'treesit)

(add-to-list 'treesit-language-source-alist
             '(hyprlang "https://github.com/tree-sitter-grammars/tree-sitter-hyprlang"))
(add-to-list 'treesit-language-source-alist
             '(janet-simple "https://github.com/sogaiu/tree-sitter-janet-simple"))

(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  (treesit-auto-langs
   '(bash
     c
     cpp
     clojure
     css
     elixir
     go
     gomod
     heex
     hyprlang
     javascript
     janet-simple
     json
     ruby
     sql))
  :hook
  (shel-mode-hook . bash-ts-mode)
  :config)

(require 'treesit-auto)

(treesit-auto-add-to-auto-mode-alist 'all)
(treesit-auto-install-all)

(add-to-list 'major-mode-remap-alist '(sh-mode . bash-ts-mode))
(add-to-list 'major-mode-remap-alist '(elixir-mode . elixir-ts-mode))
