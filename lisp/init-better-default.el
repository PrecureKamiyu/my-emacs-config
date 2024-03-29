;;; package --- Summary -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
;;
;; don't use line wrap or something
;;
(add-hook 'prog-mode-hook 'toggle-truncate-lines)
;;
;; display number
;;
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
;;
;; C-z is very dangerous, it will freeze your frame.
;;
(global-unset-key (kbd "C-z"))
;; (global-unset-key (kbd "C-w"))
;;
;; this line set the default frame pattern.  Full screen is definitely
;; preferred.
;;
(add-to-list 'default-frame-alist '(fullscreen . fullboth))
;;
;; next error follow minor mode will locate in buffer the error or the
;; warning, while cursor move through the compilation buffer.
;;
(add-hook 'compilation-mode-hook 'next-error-follow-minor-mode)

(defvar org-hide-emphasis-markers t)
;;
;; (auto-save-visited-mode t)
;; (setq auto-save-visited-interval 1)
;;
;; close menu and tool bar
;; and scroll bar as well
;;
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;;
;; what is this?
;;
(global-auto-revert-mode 1)
;;
;; don't make backup (ends with ~)
;;
(setq make-backup-files nil)
;;
;; don't make any sound in emacs
;;
(setq ring-bell-function 'ignore)
;;
;; this is useless due to auto-save
;;
;; (setq auto-save-no-message t)
(setq inhibit-startup-screen t)
;;
;; is this necessary?
;;
(setq-default major-mode
              (lambda () ; guess major mode from file name
                (unless buffer-file-name
                  (let ((buffer-file-name (buffer-name)))
                    (set-auto-mode)))))
;;
;; modify the exit confirm message
;;
(setq confirm-kill-emacs #'yes-or-no-p)
;;
;; ?
;;
(setq window-resize-pixelwise t)
(setq frame-resize-pixelwise t)
;;
;; what are these three?
;;
(save-place-mode t)
(savehist-mode t)
(recentf-mode t)
(defalias 'yes-or-no #'y-or-n-p)
;;
;; Store automatic customisation options elsewhere
;;
(setq custom-file (locate-user-emacs-file "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))
;;
;; see
;; https://emacs.stackexchange.com/questions/54427/failed-to-update-packages-getting-error-gnutls-error-process-elpa-gnu-org-5
;; for more
;;
;; and this line is used to cope with the error message
;; error in process filter: gnutls-error: (gnutls-error leetcode.com -54)
;;
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;;==================================
(require 'init-winner)
(provide 'init-better-default)
;;; init-better-default.el ends here
