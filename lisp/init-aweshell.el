;;; init-aweshell --- init file for aweshell package -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;; the file should loaded after `init-evil'
;;;
;;; Code:
(use-package aweshell
  :bind (("C-<tab>" . aweshell-dedicated-toggle)
	 :map eshell-mode-map
	 ("M-p" . nil)))

(provide 'init-aweshell)
;;; init-aweshell.el ends here
