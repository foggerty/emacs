;;; Package --- My init file.  Not a package.  Why is the linter insisting on this?
;;; Commentary:
;;; Not available for commentary.
;;; Code:

(load-file "~/.emacs.d/helpers.el")

;; Extra repositories for packages
(require 'package)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa"     . "https://melpa.org/packages/"))
(package-initialize)
;; Note to self: after a feesh install, will still need to rehresh packages.
;; Is there a way to find out if it's never been done?


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; GLobal defaults
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Ensure the required packages are loaded, and install them if not.
(helper-install-packages
 '(
   aggressive-indent
   async
   company
   company-go
   company-quickhelp
   counsel
   counsel-projectile
   dash
   exec-path-from-shell
   flx
   flx-ido
   flycheck
   flycheck-gometalinter
   flycheck-pos-tip
   flyspell-correct-ivy
   helm
   hungry-delete
   ivy
   markdown-mode
   move-line
	mwim
   neotree
   paredit
   pkg-info
   powerline
   project-explorer
   projectile
   smartparens
	whole-line-or-region
   yaml-mode
   yasnippet
   ))


;; DISABLE the bloody command key (again)
(setq ns-command-modifier 'meta)


;; Save desktop on exit
(desktop-save-mode 1)


;; Typing over selected text deletes it
(delete-selection-mode 1)


;; whole-line-or-region : cut/copy works on current line if no region
;; is highlighted, or region if there is one.  ONLY works if
;; transient-mark-mode is on (I think).
(whole-line-or-region-modqe)


;; Major mode overrides
(helper-swap-major-mode 'ruby-mode 'enh-ruby-mode)


;; Flycheck - replacement for flymake
(global-flycheck-mode 1)
(with-eval-after-load 'flycheck (flycheck-pos-tip-mode))


;; Create dir if 'finding' a non-existent file
(defun make-parent-directory ()
  "Create parent directory of current buffer."
  (make-directory (file-name-directory buffer-file-name) t))
(helper-add-to-list 'find-file-not-found-functions 'make-parent-directory)


;; Projectile mode everywhere and project explorer
(projectile-global-mode)
(setq projectile-enable-caching nil)
(setq projectile-indexing-method 'alien)
(global-set-key (kbd "<f12>") 'counsel-projectile-find-file)
(global-set-key (kbd "<f8>") 'project-explorer-toggle)

;; Use the same path you'd get in a standard shell
(exec-path-from-shell-initialize)


;; Appearance tidy ups
(load-file "~/.emacs.d/tangotango2.el") ; autoloads theme, not bothered to find our why
(setq powerline-default-separator 'bar)
(powerline-default-theme)
(temp-buffer-resize-mode t)
(setq inhibit-startup-screen t
		ns-command-modifier (quote super)
		ring-bell-function 'ignore
		tab-width 3
		temp-buffer-max-height 12
		compilation-window-height 12)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-default 'cursor-type 'bar)
(if window-system
    (helper-set-font '("Source Code Pro" "Courier New")))
(set-face-attribute 'default nil :height 145)


;; Better (smoother) scrolling
(setq scroll-conservatively 1
		mouse-wheel-progressive-speed nil
		mouse-wheel-scroll-amount (quote (2 ((shift) . 1)))
		hscroll-step 1
		truncate-lines 1)
(let 
    ((go-left '((kbd "<S-wheel-down>")
					 (kbd "<triple-wheel-right>")
					 (kbd "<double-wheel-right>")
					 (kbd "<wheel-right>")))
     (go-right '((kbd "<S-wheel-up>")
					  (kbd "<triple-wheel-left>")
					  (kbd "<double-wheel-left>")
					  (kbd "<wheel-left>"))))
  ;; Note to self, we need to eval key-press here because it will be
  ;; passed to global-set-key as is - i.e. a list.
  (dolist (key-press go-left)
    (global-set-key (eval key-press) #'((interactive) (scroll-left 1))))
  (dolist (key-press go-right)
    (global-set-key (eval key-press) #'((interactive) (scroll-right 1)))))


;; IDO - use flx
(require 'ido)
(ido-mode t)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil) ; use highlighting from flx


;; Ivy / Swiper / Counsel
(ivy-mode 1)
(counsel-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key (kbd "C-s") 'swiper)
(setq projectile-completion-system 'ivy-completing-read)


;; Global settings, defaults, and replacements for standard settings
(require 'move-line)
(require 'hungry-delete)
(global-hungry-delete-mode)
;;(electric-pair-mode)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "RET") 'newline-and-indent)
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "C-x K") 'other-window-kill-buffer)
(global-set-key (kbd "M-z") 'foggerty-zap-to-char)
(global-set-key (kbd "C-`") 'toggle-eshell)
(global-set-key (kbd "C-_") 'decrease-margin)
(global-set-key (kbd "C-+") 'increase-margin)
(global-set-key (kbd "M-_") 'decrease-font-size)
(global-set-key (kbd "M-+") 'increase-font-size)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "<s-backspace>") 'kill-to-beginning-of-line)
(global-set-key (kbd "C-M-g") 'counsel-git-grep)
(global-set-key (kbd "C-a") 'mwim-beginning-of-code-or-line)
(global-set-key (kbd "C-e") 'mwim-end-of-code-or-line)
(global-set-key (kbd "<home>") 'mwim-beginning-of-code-or-line)
(global-set-key (kbd "<end>") 'mwim-end-of-code-or-line)
(global-set-key (kbd "M-<tab>") 'helper-hs-toggle-hiding)
(setq default-tab-width 2)
(show-paren-mode t)


;; Centralised backup directory
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))


;; Replace yes/no with y/n
(defalias 'yes-or-no-p 'y-or-n-p)


;; Gobal auto-complete (Company mode)
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "C-<return>") 'company-complete)
(setq company-idle-delay nil) ;; don't auto show, use key defined above.
(company-quickhelp-mode 1)


;; yasnippet
(yas-global-mode 1)


;; Spell checking
(require 'ispell)
(setq ispell-program-name "/usr/local/bin/aspell"
		ispell-dictionary "british")


;; Flyspell for comments (prog-mode is the parent of all programming
;; hook modes).
;; Also show popup with Mouse3 (right click)
(add-hook 'prog-mode-hook
			 (lambda ()
				(flyspell-prog-mode)))
(eval-after-load "flyspell"
  '(progn
	  (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
	  (define-key flyspell-mouse-map [mouse-3] #'undefined)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Specific editing modes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load-file "~/.emacs.d/randomFunctions.el")
(load-file "~/.emacs.d/textSettings.el")
(load-file "~/.emacs.d/orgSettings.el")
(load-file "~/.emacs.d/goSettings.el")
(load-file "~/.emacs.d/elispSettings.el")
;;(load-file "~/.emacs.d/rubySettings.el")
;;(load-file "~/.emacs.d/nand2Tetris.el")
;;(load-file "~/.emacs.d/clojureSettings.el")
;;(load-file "~/.emacs.d/schemeSettings.el")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
	(quote
	 (mwim whole-line-or-region yasnippet yaml-mode smartparens project-explorer powerline paredit org-bullets neotree move-line markdown-mode hungry-delete helm go-rename go-playground go-guru go-errcheck go-eldoc go-dlv flyspell-correct-ivy flycheck-pos-tip flycheck-gometalinter flx-ido exec-path-from-shell counsel-projectile company-quickhelp company-go aggressive-indent))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
