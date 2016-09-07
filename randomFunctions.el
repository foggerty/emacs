(defun count-bytes (buffer)
  (interactive "bCount bytes in buffer: ")
  (with-current-buffer (get-buffer buffer)
	 (message "%d" (string-bytes (buffer-string)))))

(defun adjust-margins (amount)
	"Adjust current buffer's margin by +/- amount."
	;; note to self: the margins set by the set-window-margins function
	;; will no longer be applied once the current buffer no longer has
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
	(insert (map-character māori-vowels)))
