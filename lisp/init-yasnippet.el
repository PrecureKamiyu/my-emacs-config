;;; init-yasnippet --- init file for yasnippet
;;;
;;; Commentary:
;;;
;;; Code:
(use-package yasnippet
  :config
  (yas-global-mode 1)
  ;;
  ;; M-j for expand.  M-k for prev field because shift-TAB is too
  ;; hard.  And I don't use M-k.
  ;;
  (define-key yas-keymap (kbd "M-j") 'yas-next-field-or-maybe-expand)
  (define-key yas-keymap (kbd "M-k") 'yas-prev-field)
  ;;
  ;;
  ;; (define-key yas-minor-mode-map (kbd "<tab>") 'yas-expand)
  )
(provide 'init-yasnippet)
;;; init-yasnippet.el ends here
