;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Global key bindings.  Run these after ALL other packages have
;;;; been loaded, to avoid things like org-mode clobbering them.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "C-S-<up>")        'previous-buffer)
(global-set-key (kbd "C-S-<down>")      'next-buffer)
(global-set-key (kbd "C-<tab>")         'other-window)
(global-set-key (kbd "C-x C-b")         'ibuffer)
(global-set-key (kbd "C-c C-q")         'helper-indent-buffer)
(global-set-key (kbd "C-z")             'undo)
(global-set-key (kbd "C-c c")           'org-capture)
(global-set-key (kbd "C-x C-k")         'foggerty-other-window-kill-buffer)
(global-set-key (kbd "C-x k")           (qif (kill-buffer (current-buffer))))
(global-set-key (kbd "<M-S-backspace>") 'foggerty-kill-to-beginning-of-line)
(global-set-key (kbd "<f9>")            'counsel-projectile-git-grep)
(global-set-key (kbd "C-<return>")      'company-complete)
(global-set-key (kbd "M-z")             'foggerty-zap-to-char)
(global-set-key (kbd "C-x p")           'mark-paragraph)
(global-set-key (kbd "C-M-=")           'increase-margin)
(global-set-key (kbd "C-M--")           'decrease-margin)
(global-set-key (kbd "<mouse-5>")       'scroll-up-line)
(global-set-key (kbd "<mouse-4>")       'scroll-down-line)
(global-set-key (kbd "C-=")             'text-scale-increase)
(global-set-key (kbd "C--")             'text-scale-decrease)
