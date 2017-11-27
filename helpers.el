(defun helper-set-font (flist)
  "Set font to the first that it finds in flist."
  (if (not (eq nil flist))
      (let ((font (car flist)))
	(if (x-list-fonts font)
	    (set-frame-font font)
	  (helper-set-font (cdr flist))))))

(defun helper-align-buffer ()
  (interactive)
  "Aligns the entire buffer."
  (save-excursion
    (mark-whole-buffer)
    (indent-region)))
