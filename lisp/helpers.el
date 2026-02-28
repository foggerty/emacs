;;; -*- lexical-binding: t; -*-

(defun alistp (alist)
  (or (null alist)
      (and (listp alist)
           (cl-every #'consp alist))))


(defun add-to-alist (alist elements)
  (cond ((not (alistp (symbol-value alist)))
         (error "'alist' is not an alist."))
        ((not (alistp elements))
         (error "'elements' is not an alist."))
        (t (dolist (element elements)
             (add-to-list alist element)))))


(defun indent-buffer ()
  "Indents the entire buffer."
  (interactive)
  (save-excursion
    (delete-trailing-whitespace)
    (untabify (point-min) (point-max))
    (indent-region (point-min) (point-max))))


(defun helper-messages (messages)
  "Uses the message function to display a list of format-value
pairs or single strings."
  (message (string (apply 'concat (mapcar
                                   (lambda (msg)
                                     (if (atom msg)
                                         msg
                                       (format (car msg) (cadr msg))))
                                   messages)))))


(defun helper-run-if-found (name func)
  "Will call test to see if NAME is found on the current path,
  passing in the full path to FUNC if so.  Otherwise logs a
  warning."
  (let ((path (shell-command-to-string (concat "printf \"$(which " name ")\""))))
    (if (string= "" path)
        (warn (concat "Cannot find " name " on path.  Config is unhappy :-("))
      (funcall func path))))


(defmacro qif (&rest commands)
  "Create an interactive function that run COMMANDS."
  `(lambda ()
     (interactive)
     (progn ,@commands)))


(defun load-from-init (file)
  (let ((init-dir (file-name-directory user-init-file)))
    (load (concat init-dir file))))

(require 'face-remap)

(defun adjust-global-font(increment)
  (interactive)
  (let* ((height (face-attribute 'default :height))
         (new (+ height
                 (* increment global-text-scale-adjust--increment-factor))))
    (set-face-attribute 'default nil :height new)))

(provide 'helpers)

;;; helpers.el ends here.
