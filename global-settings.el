;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; eldoc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq eldoc-idle-delay 0.0)
(global-eldoc-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Basic tidy ups / tweaks.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; <tab> will first indent, then complete if hit again.
(setq tab-always-indent 'complete)


;; Fine, I'll go with spaces :-(
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)


;; File beautification
(setq delete-trailing-lines t)
;;(add-hook 'before-save-hook 'delete-trailing-whitespace)


;; On Mac, use Command key as Meta when not in terminal.
(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta))


;; Save desktop on exit
(desktop-save-mode 1)


;; Highlighted region is deleted when typing
(delete-selection-mode 1)


;; Centralised backup directory
;; Note: need absolute path 
(setq backup-directory-alist
      `((".*" . "~/.emacs.d/backups"))) 


;; Yes/no to y/n
(defalias 'yes-or-no-p 'y-or-n-p)


;; Use aspell over ispell
(helper-run-if-found
 "aspell"
 (lambda (path)
   (setq ispell-program-name path
         ispell-dictionary "british")))


;; Hungry-delete: backspace kills all whitespace until it reaches next
;; character.  Don't want it globally enabled however, as it clobbers
;; things like cc-mode's bindings.
(use-package hungry-delete
  :defer t)


;; LESS cow-bell.
(setq ring-bell-function 'ignore)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; navigation / searching.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package counsel ; will bring in both Ivy and Swiper
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
        ivy-count-format "(%d/%d) "
        ivy-initial-inputs-alist nil
        ivy-use-selectable-prompt t)
  :bind (("C-s"     . swiper)
         ("C-x C-f" . counsel-find-file)
         ("M-x"     . counsel-M-x)
         ("C-c g"   . counsel-git-grep))
  :diminish ivy-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Company (auto-complete) settings.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package company
  :init
  (global-company-mode)
  :config
  (setq company-idle-delay nil)
  :diminish company-mode)

(use-package company-quickhelp
  :defer t
  :config
  (company-quickhelp-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Projectile - project management
;;;; ToDo - put all projectile bindings behind F12.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :diminish projectile-mode)

(use-package counsel-projectile
  :config
  (add-hook 'after-init-hook 'counsel-projectile-mode)
  (setq projectile-use-git-grep t))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Mouse settings - one day this will be intuitive...
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq mouse-wheel-tilt-scroll t
      mouse-wheel-progressive-speed nil
      mouse-wheel-scroll-amount '(2 ((shift) . 1)))

(setq pixel-scroll-precision-use-momentum t
      pixel-scroll-precision-momentum-seconds 0.75
      pixel-scroll-precision-momentum-tick 0.01
      pixel-scroll-precision-mode t)

;; (when (not (display-graphic-p))
;; (xterm-mouse-mode))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Let me know what to press next....
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package which-key
  :defer t
  :init
  (which-key-mode)
  (which-key-setup-side-window-right-bottom)
  :diminish which-key-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Helpful - better help screens.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package helpful
  :bind
  (("C-h f" . helpful-function)
   ("C-h v" . helpful-variable)
   ("C-h k" . helpful-key)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Magit
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package magit
  :bind
  ("C-x g" . magit-status))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; visual-fill-column-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package visual-fill-column
  :defer t)

(defadvice set-fill-column (after refresh-visual-fill-column last activate)
  "Will check if visual-fill-column-mode is active, and adjust
margins if so."
  (visual-fill-column-adjust))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; yasnippet
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package yasnippet
  :defer t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; neotree
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package all-the-icons)

;; After installation, will need to run the
;; all-the-icons-install-fonts
(use-package neotree
  :bind
  (("<f8>" . neotree-toggle)))

(setq neo-theme (if (display-graphic-p) 'icons 'arrow)
      neo-smart-open t
      projectile-switch-project-action 'neotree-projectile-action)
