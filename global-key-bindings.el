;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Global key bindings.  Run these after ALL other packages have
;;;; been loaded, to avoid things like org-mode clobbering them.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Sigh, except that org-mode is seriously persistent in its
;; clobbering, so nuke any bindings in its local map, so they can be
;; rebound here.

;; Always run this file last.

;;(define-key org-mode-map (kbd "C-<tab>") nil)
;;(define-key c-mode-map (kbd "C-c C-q") nil)

;; Now setup custom mappings...

(global-set-key (kbd "C-<tab>")         'other-window)
(global-set-key (kbd "C-x C-b")         'ibuffer)
(global-set-key (kbd "C-c C-q")         'helper-indent-buffer)
(global-set-key (kbd "C-z")             'undo)
(global-set-key (kbd "C-c c")           'org-capture)
(global-set-key (kbd "C-x C-k")         'foggerty-other-window-kill-buffer)
(global-set-key (kbd "C-x k")           (qif (kill-buffer (current-buffer))))
(global-set-key (kbd "C-M-=")           'increase-margin)
(global-set-key (kbd "C-M--")           'decrease-margin)
(global-set-key (kbd "<M-S-backspace>") 'foggerty-kill-to-beginning-of-line)
(global-set-key (kbd "<f8>")            'treemacs)
(global-set-key (kbd "C-`")             'company-complete)
