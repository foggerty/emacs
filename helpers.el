(defun helper-set-font (flist)
  "Set font to the first that it finds in flist."
  (if (not (eq nil flist))
      (let ((font (car flist)))
	(if (x-list-fonts font)
	    (set-frame-font font)
	  (helper-set-font (cdr flist))))))

(defun helper-parent-modes (mode)
  "Returns a list containing mode, and its parent modes."
  (if mode
      (cons mode (helper-parent-modes (get mode 'derived-mode-parent)))))

(defun helper-any-in-list (source test)
  "Return t if any of the items in sourece are found in test.
   Todo - check that parameters are both lists!"
  (cond ((null source) nil)
	((member (car source) test) t)
	(t (helper-any-in-list (cdr source test)))))

(defun helper-indent-buffer ()
  "Indents the entire buffer."
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max))))

;;; TODO - write a sting-interpolation function to automatically add
;;; newlines.
(defun helper-messages (messages)
  "Uses the message function to display a list of format-value
pairs or single strings."
  (message (apply 'concat (mapcar
			   (lambda (msg)
			     (if (atom msg)
				 msg
			       (format (car msg) (cadr msg))))
			   messages))))

(defun helper-do-my-tax (rate hours)
  "Calculate how much tax to pay, and how much to put into savings etc."
  (interactive "nRate: \nnHours: ")
  (let* ((total (* rate hours))
	 (gst (* total .15))
	 (withholding (* total .26))
	 (paid (- total withholding))
	 (extra-tax (* total .04))
	 (kiwisaver (* total 0.1))
	 (savings (* total .2))
	 (left-with (- total withholding extra-tax kiwisaver savings)))
    (helper-messages
     `(("Total: %#.2f\n" ,total)
       ("GST: %#.2f\n" ,gst)
       ("Withholding tax: %#.2f\n" ,withholding)
       ("Paid (ex GST): %#.2f\n" ,paid)
       ("Extra tax: %#.2f\n" ,extra-tax)
       ("Kiwisaver: %#.2f\n" ,kiwisaver)
       ("Savings: %#.2f\n" ,savings)
       ("left-with: %#.2f\n" ,left-with)))))


