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

(defun helper-run-if-found (name func)
  "Will call test to see if name is found on the current path,
  and will pass in the full path to func if so.  Otherwise logs a
  warning."
  (let ((path (shell-command-to-string (concat "printf \"$(which " name ")\""))))
	 (if (string= "" path)
		  (warn (concat "Cannot find " name " on path.  Config is unhappy :-("))
		(funcall func path))))

(defmacro q-funk (commands)
  "Quick-Function: Creates an interactive function that runs COMMANDS."
  `(lambda ()
     (interactive)
     (progn ,commands)))

