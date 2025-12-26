;;; -*- lexical-binding: t; -*-

;;;; Major mode for Nans2Tetris assembler files.  (symbol) is always
;;;; hard left, everything else except for comment lines indented by a
;;;; single tab.


(defun n2t-screen-address (x y)
  "Given x/y coordinates, will calculate the bit in RAM."
  (interactive "nX: \nnY: ")
  (message "%d"
	       (+ 16384
	          (* y 32)
	          (% x 16))))


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
    (define-key map (kbd "M-s M-s") 'n2t-screen-address)
    map)
  "Keymap for n2t-asm-mode.")


;; Syntax highlighting
(defconst n2t-asm-font-lock
  (list
   (cons "(.*)"            font-lock-function-name-face)
   (cons "@[0-9a-zA-Z-]+"  font-lock-builtin-face))
  "Font-lock keywords for n2t-asm-mode.")


;; Indentation - labels hard left, everything else one tab in.
(defun n2t-indent-line ()
  "Indent current line."
  (interactive)
  (save-excursion
    (beginning-of-line)
    ;; loop symbol and one-line comments
    (if (or (looking-at "^[ \t]*(")
	    (looking-at "^[ \t]*//"))
	(indent-line-to 0)
      ;; everything else
      (indent-line-to default-tab-width))))


;; Syntax table - lets Emacs know what comments, words, operators etc
;; look like.
(defvar n2t-asm-syntax-table
  (let ((st (make-syntax-table)))
    (modify-syntax-entry ?/ ". 12" st)
    (modify-syntax-entry ?\n ">" st)
    st)
  "Syntax table for nt2-asm-mode")


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
  (run-hooks 'n2t-asm-mode-hook))

(provide 'n2t-asm-mode)
