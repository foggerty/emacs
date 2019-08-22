;; https://www.reddit.com/r/emacs/comments/cdei4p/failed_to_download_gnu_archive_bad_request/
;; This _should_ be fixed in 26.3.

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(use-package cider
  :ensure t)


