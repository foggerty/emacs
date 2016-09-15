;;; Package --- My init file.  Not a package.  Why is the linter insisting on this?
;;; Commentary:
;;; Not available for commentary.
;;; Code:

(load-file "~/.emacs.d/helpers.el")

;; Extra repositories for packages
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa"     . "https://melpa.org/packages/"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; GLobal defaults
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Ensure the required packages are loaded, and install them if not.
(helper-install-packages
 '(
   counsel
   dash
   exec-path-from-shell
   flyspell-correct-ivy
	helm
   hungry-delete
   ivy
   company
   flx
   flx-ido
   flycheck
   flycheck-pos-tip
   markdown-mode
   move-line
   neotree
   paredit
   pkg-info
   projectile
   smartparens
   yaml-mode
   async
   ))


;; DISABLE the bloody command key (again)
(setq ns-command-modifier 'meta)


;; Org capture template for journal
(setq org-capture-templates
      '(("j" "Journal entry"
	 entry (file+datetree "~/Google Drive/Documents/Journal Entries/journal.org")
	 "* %?\n%U\n")))


;; Save desktop on exit
(desktop-save-mode 1)


;; Typing over selected text deletes it
(delete-selection-mode 1)


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


;; Projectile mode everywhere
(projectile-global-mode)
(setq projectile-enable-caching nil)
(setq projectile-indexing-method 'alien)
(global-set-key (kbd "<f12>") 'counsel-projectile-find-file)


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
(set-frame-font "Source Code Pro")
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
(setq ivy-use-virtual-buffers t)
(global-set-key (kbd "C-s")     'swiper)
;;(global-set-key (kbd "M-x")     'counsel-M-x)
;; (global-set-key (kbd "C-x C-f") 'counsel-find-file)
;; (global-set-key (kbd "C-c p d") 'counsel-projectile-find-dir)
;; (global-set-key (kbd "C-c p p") 'counsel-projectile)
;; (global-set-key (kbd "C-x r b") 'counsel-bookmark) ; C-c r m = create bookmark
(counsel-mode 1)

;; Global settings, defaults, and replacements for standard settings
(require 'move-line)
(require 'hungry-delete)
(global-hungry-delete-mode)
(electric-pair-mode)
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
(global-set-key (kbd "C-c /") 'comment-region)
(global-set-key (kbd "C-c ?") 'uncomment-region)
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
;(load-file "~/.emacs.d/orgSettings.el")
(load-file "~/.emacs.d/goSettings.el")
(load-file "~/.emacs.d/elispSettings.el")
;;(load-file "~/.emacs.d/rubySettings.el")
;;(load-file "~/.emacs.d/nand2Tetris.el")
;;(load-file "~/.emacs.d/clojureSettings.el")
;;(load-file "~/.emacs.d/schemeSettings.el")

