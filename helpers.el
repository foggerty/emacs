(defun helper-install-packages (packages)

  (unless package-archive-contents
	 (package-refresh-contents))

  (dolist (p packages)
	 (unless (package-installed-p p)
		(package-install p))))
