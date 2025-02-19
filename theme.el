;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Basic tidy ups
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(setq inhibit-startup-screen t)
(setq-default frame-title-format '("%b"))
(setq-default line-spacing 2) ; 2 extra pixels under lines

(add-to-alist 'default-frame-alist
              '((vertical-scroll-bars . nil)
                (menu-bar-lines . nil)
                (undecorated . t)
                (drag-internal-border . 1)
                (internal-border-width . 5)
                (alpha-background . 0.85)))


(global-set-font '("Source Code Pro-12"
                   "Liberation Mono-12"
                   "Consolas-12"
                   "Monospace"
                   "Courier New-12"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Make pretty with themes etc.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package ewal-spacemacs-themes)

(cond ((or (daemonp) (display-graphic-p))
       (load-theme 'ewal-spacemacs-classic t))
      (t (load-theme 'wombat)))

;;; Cursor
(set-default 'blink-cursor-blinks 0) ; always blink
(set-default 'blink-cursor-interval 0.25) ; blink faster!
(set-default 'cursor-type 'bar)

;;;; Smooth scrolling (GUI only)
(pixel-scroll-precision-mode)

;;; Highlight current line
(global-hl-line-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Specific fonts for specific modes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Italic comments.
(custom-set-faces
 '(font-lock-comment-face ((t (:slant italic)))))

;;; Make org-mode pretty.


(custom-theme-set-faces
 'user
 '(variable-pitch ((t (:family "Verdana" :height 1.25 ))))
 '(fixed-pitch ((t ( :family "Source Code Pro" :height 1.25 :inherit 'default))))
 '(org-level-1 ((t (:height 1.0))))
 '(org-level-2 ((t (:height 1.0))))
 '(org-block ((t (:inherit fixed-pitch))))
 '(org-code ((t (:inherit (shadow fixed-pitch)))))
 '(org-document-info ((t (:foreground "dark orange"))))
 '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
 '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
 '(org-link ((t (:underline t))))
 '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-property-value ((t (:inherit fixed-pitch))) t)
 '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
 '(org-table ((t (:inherit fixed-pitch :foreground "#83a598"))))
 '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
 '(org-verbatim ((t (:inherit (shadow fixed-pitch))))))
