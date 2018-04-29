(defun count-bytes (buffer)
  (interactive "bCount bytes in buffer: ")
  (with-current-buffer (get-buffer buffer)
    (message "%d" (string-bytes (buffer-string)))))

(defun adjust-margins (amount)
  "Adjust current buffer's margin by +/- amount."
  ;; note to self: the margins set by the set-window-margins function
  ;; will no longer be applied once the current buffer loses focus
  ;; focus.  Instead, set the buffer-local variables
  ;; left/right-margin-width and then set the window's buffer to be
  ;; the current buffer, which forces an update/redraw.
  (let* ((margins (window-margins))
	 (left  (if (-cons-pair? margins) (car margins) 0))
	 (right (if (-cons-pair? margins) (cdr margins) 0)))
    (setq left-margin-width
	  (max 0 (+ amount left)))
    (setq right-margin-width
	  (max 0 (+ amount right)))
    (set-window-buffer nil (current-buffer))))

(defun increase-margin ()
  "Increase current margin by 1."
  (interactive)
  (adjust-margins 1))

(defun decrease-margin ()
  "Decrease current margin by 1."
  (interactive)
  (adjust-margins -1))

(defun adjust-font-size (amount)
  "Adjust current frame's font by relative amount (percentage)."
  ;; Maxing out at 310 because I have a stupidly fast key-repeat, and
  ;; past that it's a) unreadable and b) slows Emacs to a crawl for a
  ;; wee while :-)
  (let ((current (face-attribute 'default :height)))
    (set-face-attribute 'default nil :height
			(min 310 (truncate (* (+ amount 1) current))))))

(defun increase-font-size ()
  (interactive)
  (adjust-font-size 0.10))

(defun decrease-font-size ()
  (interactive)
  (adjust-font-size -0.10))

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

(defun map-character (map)
  "Maps next key-press using the provided map."
  (let* ((char (char-to-string (read-key)))
	 (test (assoc char map)))
    (if test (cdr test)
      char)))

(defun map-maori-vowel () 
  "Maps a,e,i,o,u to the Māori equivalents."
  (interactive)
  (let ((vowel (map-character māori-vowels)))
    (insert vowel)
    vowel))

(defun kill-to-beginning-of-line ()
  "Kills from current point, to the beginning of the line.
Takes visual-line-mode into account; if it is enabled, only deletes
to the beginning of the screen line, otherwise deletes until the
beginning of the logical line."
  (interactive)
  (save-excursion
    (push-mark)
    (if visual-line-mode
	(beginning-of-visual-line)
      (beginning-of-line))
    (kill-region (point) (mark))))


;; Ripped from Stack Overflow
(defun other-window-kill-buffer ()
  "Kill the buffer in the other window"
  (interactive)
  ;; Window selection is used because point goes to a different window
  ;; if more than 2 windows are present
  (let ((win-curr (selected-window))
        (win-other (next-window)))
    (select-window win-other)
    (kill-buffer-and-window)
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
