(defun helper-install-packages (packages)
  "Install a package if it is not already installed."
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (p packages)
    (unless (package-installed-p p)
      (package-install p))))

(defun helper-swap-major-mode (original new)
  "Swaps out one major mode (if found) for another."
  ;; Cannot rely on shadowing, I don't think; whatever sets up the
  ;; file/mode associations probably just walks the list, overwriting
  ;; whatever is now at the front.  i.e. shadowing only works if
  ;; someone is searching on key/value, as it will be added to the
  ;; front of the list.
  (let ((hold (rassoc original auto-mode-alist)))
    (if hold
	(progn
	  (rassq-delete-all 'original auto-mode-alist)
	  (add-to-list 'auto-mode-alist
		       (cons (car hold) new))))))

(defun helper-add-to-list (lst fun)
  "Adds fun to list unless it is already contained.  If list is
nil, returns a new list containing fun. (Works with functions.)"
  (cond ((not lst) (list fun))
	((member fun lst)	lst)
	(t (add-to-list lst fun))))


;; Ripped from Stack Overflow
(defun other-window-kill-buffer ()
  "Kill the buffer in the other window"
  (interactive)
  ;; Window selection is used because point goes to a different window
  ;; if more than 2 windows are present
  (let ((win-curr (selected-window))
        (win-other (next-window)))
    (select-window win-other)
    (kill-this-buffer)
    (select-window win-curr)))


;; Want a zap-to-char that doesn't kill the char!
(defun foggerty-zap-to-char (arg char)
  "Replacement for zap-to-char that doesn't also kill char."
  (interactive "p\ncZap to char: ")
  (save-excursion
    (kill-region
     (point)
     (if current-prefix-arg
				 (1+ (search-backward (char-to-string char)))
			 (1- (search-forward (char-to-string char)))))))


;; EShell - always in the same frame
(defun toggle-eshell ()
  (interactive)
  (let ((shell (get-buffer "*eshell*")))
    (cond ((eq shell (current-buffer))
					 (switch-to-buffer (previous-buffer)))
					(shell
					 (switch-to-buffer shell))
					(t (eshell)))))


;; Add a mod hook, but first remove if already there
(defun helper-add-hook (hook fun)
	"Adds hook, after first removing it if it's already there."
	(remove-hook hook fun)
	(add-hook hook fun))

(defun helper-set-font (flist)
	"Set font to the first that it finds in flist."
	(if (not (eq nil flist))
			(let ((font (car flist)))
				(if (x-list-fonts font)
						(set-frame-font font)
					(helper-set-font (cdr flist))))))
