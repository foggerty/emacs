;; -*- lexical-binding: t; -*-

;; Everything comes from this one person: https://github.com/minad

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Orderless - completion styles.
;;;
;;

(use-package orderless
  :custom
  (orderless-matching-styles '(orderless-prefixes))
  (completion-ignore-case t))

(setq completion-styles '(basic substring initials orderless)
      completion-category-overrides '((file (styles basic partial-completion))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Completion-at-point using Corfu.
;;;
;;

;; TAB key: fix indentation if needed, otherwise perform completion

(setq tab-always-indent 'complete)

(use-package corfu
  :hook (after-init . global-corfu-mode)
  :custom
  (corfu-cycle t) ; cycle around to first entry after reaching the last
  (corfu-preview-current nil) ; don't expand text at point until I press return
  (corfu-min-width 20)
  (corfu-on-exact-match 'insert) ; complete if there is only a single candidate
  (corfu-quit-no-match t)
  (corfu-quit-at-boundary t)
  :config
  (setq corfu-popupinfo-delay '(1.25 . 0.5))
  (corfu-popupinfo-mode 1) ; shows documentation next to completions
  ;; sort by input history
  (with-eval-after-load 'savehist
    (corfu-history-mode 1)
    (add-to-list 'savehist-additional-variables 'corfu-history)))

(use-package cape
  :defer 1
  :config
  (add-hook 'completion-at-point-functions #'cape-file 20))

(use-package kind-icon
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Mini-buffer completion (Completing-read)
;;;
;;

(use-package vertico
  :demand t
  :bind (:map minibuffer-local-map
              ("<tab>" . vertico-next)
              ("<backtab>" . vertico-previous))
  :custom
  (vertico-cycle t) ; C-n at the bottom of the list loops around to the top
  :config
  (vertico-mode t)
  (vertico-reverse-mode t)
  ;; Verticos highlight font was clashing with my comletion part, so adjust the font faces
  (set-face-attribute 'vertico-current nil
                      :weight 'bold
                      :inverse-video nil)
  (set-face-attribute 'completions-common-part nil
                      :weight 'bold))

(use-package vertico-directory
  :after vertico
  :ensure nil
  :bind (:map vertico-map
              ("RET" . vertico-directory-enter)
              ("DEL" . vertico-directory-delete-char)
              ("M-DEL" . vertico-directory-delete-word))
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Marginalia - info in mini-buffer margin,
;;;
;;

(use-package marginalia
  :custom
  (marginalia-align 'right)
  :config
  (marginalia-mode t)
  (set-face-attribute 'marginalia-documentation nil
                      :inherit nil
                      :slant 'italic))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Consult - nicer UI alternatives using the above functionality.
;;;
;;

(use-package consult
  :bind (;; new functionality
         ("M-g l" . consult-line)
         ("M-g m" . consult-mark)
         ("H-r" . consult-ripgrep)
         ;; replace built-in functions with superior versions
         ("M-y" . consult-yank-pop)
         ("C-x 4 b" . consult-buffer-other-window)
         ("C-x t b" . consult-buffer-other-tab)
         ([remap Info-search] . consult-info)
         ([remap list-buffers] . ibuffer)))
