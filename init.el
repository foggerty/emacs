;;; Package --- My init file.  Not a package.  Why is the linter insisting on this?
;;; Commentary:
;;; Not available for commentary.
;;; Code:

(load-file "~/.emacs.d/helpers.el")

;; Extra repositories for packages
(setq package-archives
      '(;;("gnu"       . "https://elpa.gnu.org/packages/")
		  ("marmalade" . "https://marmalade-repo.org/packages/")
		  ("melpa"     . "https://melpa.org/packages/")
		  ))
(require 'package)
(package-initialize)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; GLobal defaults
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; ;; Ensure the required packages are loaded, and install them if not.
(helper-install-packages
 '(atom-one-dark-theme
   async
   company
	dash
	exec-path-from-shell
   flx
   flx-ido
   flycheck
   flycheck-pos-tip
   helm
   helm-anything
   helm-company
   helm-flx
   helm-flyspell
   helm-projectile
   markdown-mode
   move-line
   neotree
   paredit
   pkg-info
   projectile
   smartparens
   spaceline
   spacemacs-theme
   yaml-mode
	hungry-delete))


;; ;; 'Safe' themes
;; ;; Note to self: only have ONE custom-set-variables thingy.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
	["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-safe-themes
	(quote
	 ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476"
	  "2f78d26d64f922b3c4959ed2581a60ac905b29aa9b4e59c9e6bc5bec390176f7"
	  "4f0f2f5ec60a4c6881ba36ffbfef31b2eea1c63aad9fe3a4a0e89452346de278"
	  "5999e12c8070b9090a2a1bbcd02ec28906e150bb2cdce5ace4f965c76cf30476")))
 '(org-agenda-files nil))


;; Save desktop on exit
(desktop-save-mode 1)


;; Typing over selected text deletes it
(delete-selection-mode 1)


;; Playing with these - right now will not split vertically, so always
;; get side by side screens (screens are wide, not deep).  I still
;; want to know if I can set it up so that tab completions are in the
;; bottom half of the screen, _no matter how may horizontal splits
;; there are._
(setq split-height-threshold nil)
(setq split-width-threshold 1000)


;; Major mode overrides
(helper-swap-major-mode 'ruby-mode 'enh-ruby-mode)


;; E-Shell customisation
(require 'eshell)
(setq eshell-visual-options
      (quote (("git" "log" "diff" "show"))))

(add-hook 'eshell-mode-hook
			 (lambda ()
				(setenv "TERM" "emacs")))

(setq eshell-prompt-function
      (lambda ()
		  (propertize 
			(concat (eshell/dirs) " $ ")
			'face
			`(:foreground "green"))))


;; Flycheck - replacement for flymake
(global-flycheck-mode 1)
(with-eval-after-load 'flycheck (flycheck-pos-tip-mode))


;; Create dir if 'finding' a non-existent file
(defun make-parent-directory ()
  "Create parent directory of current buffer."
  (make-directory (file-name-directory buffer-file-name) t))
(helper-add-to-list 'find-file-not-found-functions 'make-parent-directory)


;; ;; NeoTree
;; (require 'neotree)
;; (require 'projectile)
;; (global-set-key (kbd "<f8>") 'neotree-toggle)
;; (setq neo-smart-open t)
;; (setq projectile-switch-project-action 'neotree-projectile-action)


;; Helm
(require 'helm)
(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(helm-projectile-on)
(helm-autoresize-mode nil)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match t)


;; Projectile mode everywhere
(projectile-global-mode)
(setq projectile-enable-caching nil)
(setq projectile-indexing-method 'alien)
(global-set-key (kbd "<f12>") 'projectile-find-file)


;; Use the same path you'd get in a standard shell
(exec-path-from-shell-initialize)


;; Appearance tidy ups
(load-theme 'tangotango) ; get the org bullets from tangotango...
(load-theme 'atom-one-dark) ; and the colors from atom-one-dark
(setq inhibit-startup-screen t)
(setq ns-command-modifier (quote meta))
(setq ring-bell-function 'ignore)
(setq tab-width 3)
(temp-buffer-resize-mode t)
(setq temp-buffer-max-height 12)
(setq compilation-window-height 12)
(setq compilation-he)

(require 'spaceline-config)
(setq powerline-default-separator 'bar)
(spaceline-emacs-theme)
(spaceline-helm-mode)
(spaceline-toggle-minor-modes-off)
(spaceline-compile)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-default 'cursor-type 'bar)
(set-frame-font "Inconsolata")
(set-face-attribute 'default nil :height 145)


;; Better (smoother) scrolling
(setq scroll-conservatively 1)
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-scroll-amount (quote (2 ((shift) . 1))))
(setq hscroll-step 1)
(setq truncate-lines 1)
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
(setq ispell-program-name "/usr/local/bin/aspell")
(setq ispell-dictionary "british")


;; Flyspell for comments (prog-mode is the parent of all programming
;; hook modes).
;; Also show popup with Mouse3 (right click)
(add-hook 'prog-mode-hook
			 (lambda ()
				(flyspell-prog-mode)))
(global-set-key (kbd "M-$") 'helm-flyspell-correct)
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
(load-file "~/.emacs.d/rubySettings.el")
(load-file "~/.emacs.d/nand2Tetris.el")
;; ;;(load-file "~/.emacs.d/clojureSettings.el")
;; ;;(load-file "~/.emacs.d/schemeSettings.el")

;; I cannot get rid of this....
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
