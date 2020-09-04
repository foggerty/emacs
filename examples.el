(defun get-parent-modes (mode)
  "Returns a list containing mode, and its parent modes."
  (if mode
      (cons mode (helper-parent-modes (get mode 'derived-mode-parent)))))

(setq māori-vowels
      '(("a" . "ā")
        ("e" . "ē")
        ("i" . "ī")
        ("o" . "ō")
        ("u" . "ū")
        ("A" . "Ā")
        ("E" . "Ē")
        ("I" . "Ī")
        ("O" . "Ō")
        ("U" . "Ū")))

(defun foggerty-map-character (map)
  "Maps next key-press using the provided map."
  (let* ((char (char-to-string (read-key)))
         (test (assoc char map)))
    (if test (cdr test)
      char)))

(defun foggerty-map-maori-vowel ()
  "Maps a,e,i,o,u to the Māori equivalents."
  (interactive)
  (let ((vowel (foggerty-map-character māori-vowels)))
    (insert vowel)
    vowel))


(defun untabify-files (files)
  "Just to remind myself how to batch-process files in Emacs :-)"
  (dolist (file files)
    (with-current-buffer (find-file-noselect file)
      (indent-region (point-min) (point-max))
      (untabify (point-min) (point-max))
      (save-buffer)
      (kill-buffer (current-buffer)))))

(defun visit-project-files (action filter)
  "Using Ivy and Projectile, select a project, and then perform a
  user-supplied action (which should accept a buffer) on each
  file.  An optional filter function can be supplied."
  (let* ((project (ivy-read "Project: " (projectile-open-projects)))
         (filter-func (lambda (x) (string-match filter x)))
         (files (seq-filter filter-func (projectile-project-files project))))
    (dolist (file files)
      (let ((closing-func (if (get-file-buffer file)
                              'ignore
                            'kill-buffer))
            (buff (or (get-file-buffer file)
                      (find-file-noselect file))))
        (with-current-buffer buff
          (funcall action buff)
          (funcall closing-func (current-buffer)))))))

(defun visit-extract (extraction-func filter)
  "Extract from each file in the project, whatever
  extraction-func returns, and put it all into a temporary buffer.

  extraction-func should take a buffer, and return a string."
  (let ((tmp (generate-new-buffer "*VISIT*")))
    (visit-project-files
     (lambda (buff)
       (with-current-buffer tmp
         (insert (concat
                  (funcall extraction-func buff)
                  "\n"))))
     filter)
    (switch-to-buffer tmp)))

(defun line-x (x)
  (lambda (buff)
    (goto-line x)
    (push-mark)
    (end-of-line)
    (let ((result (buffer-substring-no-properties
                   (region-beginning)
                   (region-end))))
      (pop-mark)
      (buffer-name buff))))
