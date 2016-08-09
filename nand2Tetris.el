;;;; Major mode for Nans2Tetris assembler files.  (symbol) is always
;;;; hard left, everything else except for comment lines indented by a
;;;; single tab.


(defun n2t-asm-align-buffer ()
  "Indents the whole buffer."
  (interactive)
  (save-excursion
    (mark-whole-buffer)
    (indent-region (point-min) (point-max))
    (align-regexp (point-min) (point-max) "\\(.\\)//")))


;; mode hook
(defvar n2t-asm-mode-hook
  nil
  "Hook for N2t assembler mode.")


;; key map
(defvar n2t-asm-mode-map
  (let ((map (make-keymap)))
    (define-key map (kbd "C-M-q") 'n2t-asm-align-buffer)
    map)
  "Keymap for n2t-asm-mode")


;; Syntax highlighting
(defconst n2t-asm-font-lock
  (let ((registers
	 (regexp-opt '("R0" "R1" "R2" "R3"
		       "R4" "R5" "R6" "R7"
		       "R8" "R9" "R10" "R11"
		       "R12" "R13"
		       "SPC" "LCL" "ARG"
		       "THIS" "THAT"
		       "SCREEN" "KEYBOARD")))
	(labels "(.*)")
	(symbols "@\\sw+"))
    (list
     (cons registers  font-lock-constant-face)
     (cons labels     font-lock-function-name-face)
     (cons symbols    font-lock-builtin-face)))
  "Font-lock keywords for n2t-asm-mode.")



;; Indentation - labels hard left, everything else one tab in.
(defun n2t-indent-line ()
  "Indent current line."
  (interactive)
  (save-excursion
    (beginning-of-line)
    ;; loop symbol and one-line comments
    (if (or 
	 (looking-at "^[ \t]*(")
	 (looking-at "^[ \t]*//"))
	(indent-line-to 0)
      ;; everything else
      (indent-line-to 3))))


;; Syntax table - lets Emacs know what comments look like.
(defvar n2t-asm-syntax-table
  (let ((st (make-syntax-table)))

    (modify-syntax-entry ?/ "<" st)
    (modify-syntax-entry ?\n ">" st)

    st)
  "Syntax table for wpdl-mode")


;; The actual mode that ties it all together.
(defun n2t-asm-mode ()
  "Major mode for editing N2t .asm files."
  (interactive)
  (kill-all-local-variables)
  (set-syntax-table n2t-asm-syntax-table)
  (use-local-map n2t-asm-mode-map)
  (set (make-local-variable 'font-lock-defaults) '(n2t-asm-font-lock))
  (set (make-local-variable 'indent-line-function) 'n2t-indent-line)
  (setq major-mode 'n2t-asm-mode)
  (setq mode-name "N2T ASM")
  ;;  (run-hooks 'n2t-asm-mode-hook)
(message "ARGH!")  )

(provide 'n2t-asm-mode)

