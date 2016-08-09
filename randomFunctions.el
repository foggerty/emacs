(defun count-bytes (buffer)
  (interactive "bCount bytes in buffer: ")
  (with-current-buffer (get-buffer buffer)
	 (message "%d" (string-bytes (buffer-string)))))

