;;; init-org --- init for org-mode -*- lexical-binding: t -*-
;;;
;;; Commentary:
;;;
;;; Center the content.  Don't open other window when open link.  Hide
;;; marker.  Use bullet and indent mode.  LaTeX preview use dvipng.
;;; Scale is 3.  A slight zoom.  A function that refresh the latex
;;; previewing.
;;;
;;; Code:
;;
;; change the open-link behavior.  Now we defaultly open link in
;; current window.
;;
(setq org-link-frame-setup
      '((file . find-file) (wl . wl)))
;;
;; Used to decrease init time.
;;
(setq org-modules-loaded t)
;;
;; Hide markers like * for emphasi0
;;
(defvar org-hide-emphasis-markers t)
;;
;; use org and add indent mode and bullets mode hook, although for
;; some reason this doesn't work
;;
(use-package org
  :hook ((org-mode . org-indent-mode)
	 (org-mode . org-bullets-mode)))
;;
;;; babel support
;;
;; activate languages
;;
(org-babel-do-load-languages
 'org-babel-load-languages
 '((shell . t)
   (python . t)
   ;;
   ;; C++ babel support is unabled.
   ;;
   ;;(c++ . t)
   (org . t)))

(add-to-list 'org-src-lang-modes '("html" . web))


;;
;; hide keywords for org options like #+title after you add new
;;   options, it can not automatically hide
;;
(defvar my-org-hidden-keywords
  '(title author date email tags options))

;;; if interactive is added, you can call this function via M-x
(defun org-hide-keywords ()
  ; (interactive)
  (save-excursion
    (let (beg end ov)
      (goto-char (point-min))
      (while (re-search-forward
	      (concat "\\(^[ \t]*#\\+\\)\\("
		      (mapconcat (lambda (kw)
				   (format "%s:\s"(symbol-name kw)))
				 my-org-hidden-keywords "\\|")
		      "\\)")
	      nil t)
	(setq beg (match-beginning 1)
	      end (match-end 2)
	      ov  (make-overlay beg end))
	(overlay-put ov 'invisible t)))))
;;
;;
;; add above function to org mode hook
;;
;;(add-hook 'org-mode-hook 'org-hide-keywords)
;;
;;
;; :scale means the quality for the output image.  zoom means the size
;; of the displayed image.
;;
(setq org-format-latex-options (plist-put org-format-latex-options :scale 3.0))
(setq org-format-latex-options (plist-put org-format-latex-options :zoom 1))
;;
;; set the image conversion program as dvipng.  The possible
;; alternavtives are imagemagick, and dvisvgm.  If your emacs does not
;; support svg file, then you should use dvipng.
;;
;; (setq org-latex-create-formula-image-program 'dvipng)
(setq org-preview-latex-default-process 'dvipng)
;;
;;
;; this is my function for reloading and toggle preview.
(defun my/org-latex-preview-reload ()
  (interactive)
  (call-interactively 'org-latex-preview-clear-cache)
  (org-latex-preview))
(setq-local org-latex-preview-precompile nil)
(provide 'init-org)
;;; init-org.el ends here
