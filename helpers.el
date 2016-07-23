(defun helper-install-packages (packages)
  "Install a package if it is not already installed."
  (unless package-archive-contents
	 (package-refresh-contents))

  (dolist (p packages)
	 (unless (package-installed-p p)
		(package-install p))))

(defun helper-swap-major-mode (original new)
  "Swaps out one major mode (if found) for another."
  ;; Cannot rely on shadowing I don't think; whatever sets up the
  ;; file/mode associations, probably just walks the lists,
  ;; overwriting whatever is now at the front.  i.e. shadowing only
  ;; works if someone is searching on key/value.
  (let ((hold (rassoc original auto-mode-alist)))
    (if hold
	(progn
	  (rassq-delete-all 'original auto-mode-alist)
	  (add-to-list 'auto-mode-alist
		       (cons (car hold) new))))))


