;;; init-munually --- some manual init back then, now just some shit
;;;
;;; Commentary:
;;;
;;; Some weird things happen before.  I don't know the safe sequence of
;;; initing package.  So you should better not touch this file (so much).
;;;
;;; Code:
(custom-set-faces
 '(font-lock-comment-face ((t (:slant italic)))))
(set-face-attribute 'default nil :height 270)
(require 'init-winner)
(require 'init-color-rg)
(winner-mode)
(awesome-tray-mode)
(setq url-proxy-services
      '(("http"     . "127.0.0.1:7890")
	("https"    . "127.0.0.1:7890")
        ("no_proxy" . "^.*\\(aventail\\|seanet\\)\\.com")))
(menu-bar-mode -1)
(provide 'init-manually)
;;; init-manually.el ends here
