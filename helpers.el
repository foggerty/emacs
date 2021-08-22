(defun helper-indent-buffer ()
  "Indents the entire buffer."
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max))))

;;; TODO - write a sting-interpolation function to automatically add
;;; newlines - or figure out how to use build in string formatting.
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

(defmacro qif (&rest commands)
  "Quick-Interactive-Function: create an interactive function that runs COMMANDS."
  `(lambda ()
     (interactive)
     (progn ,@commands)))
