;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Settings that apply to more than one programming mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)

(use-package aggressive-indent
  :defer t)

(use-package highlight-parentheses)

(use-package markdown-mode)

(use-package paredit
  :ensure t)

(use-package git-timemachine
  :bind
  (("C-c t" . git-timemachine-toggle)))

(use-package rainbow-mode)

(add-hook 'prog-mode-hook (qif (diminish 'paredit-mode)
                               (diminish 'eldoc-mode)
                               (electric-pair-mode)
                               (show-paren-mode 1)
                               (highlight-parentheses-mode 1)
                               (rainbow-mode)))

(setq eldoc-echo-area-use-multiline-p 1)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Tree-sitter
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (setq treesit-auto-langs
        '(awk
          bash
          c
          c-sharp
          clojure
          cmake
          commonlisp
          cpp
          css
          elixir
          go
          gomod
          html
          janet
          javascript
          json
          lua
          make
          ;;markdown
          org
          proto
          python
          sql
          toml
          yaml))
  
  (treesit-auto-add-to-auto-mode-alist 'all)
  (treesit-auto-install-all)
  mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Misc modes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package systemd)
