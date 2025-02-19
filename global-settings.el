;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; eldoc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq eldoc-idle-delay 0.0)
(global-eldoc-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Basic tidy ups / tweaks.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Mouse-mode in terminals
(xterm-mouse-mode)

;; <tab> will first indent, then complete if hit again.
(setq tab-always-indent 'complete)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)


;; File beautification
(setq delete-trailing-lines t)


;; On Mac, use Command key as Meta when not in terminal.
(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta))


;; Save desktop on exit
(desktop-save-mode 1)
(setq desktop-dirname "~/.emacs.d/desktop")
(make-directory desktop-dirname t)


;; Centralised backup directory
(setq backup-directory-alist
      `((".*" . "~/.emacs.d/backups"))) 
(make-directory "~/.emacs.d/backups" t)

;; Highlighted region is deleted when typing
(delete-selection-mode 1)


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
;;;; Show less pop-ups when compiling
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq native-comp-async-report-warnings-errors 'silent)


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
         ("C-<S-S>" . isearch-forward)  ;; doesn't work in terminal
         ("C-x C-f" . counsel-find-file)
         ("M-x"     . counsel-M-x)
         ("C-c g"   . counsel-git-grep)
         :map ivy-minibuffer-map
         ("<next>" . ivy-scroll-up-command)
         ("<prior>" . ivy-scroll-down-command))
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
  (setq projectile-use-git-grep t)
  :bind
  (("<f12>" . counsel-projectile-find-file)))


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
;;;; treemace
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package all-the-icons)

;; After installation, will need to run the
;; all-the-icons-install-fonts
(use-package treemacs
  :bind
  (("<f8>" . treemacs)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Standard regex-replace
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package visual-regexp-steroids
  :config
  (advice-add 'replace-regexp-as-diff :override #'vr/query-replace))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Golden-ratio
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package golden-ratio-scroll-screen
  :config
  (golden-ratio-mode))
