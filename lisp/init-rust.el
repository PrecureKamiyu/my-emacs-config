;;; init-rust --- init for rust mode
;;; Commentary:
;;;
;;; Code:
(use-package rust-mode)
;;
;; some configs don't work in rust-ts-mode.
;;
(use-package rust-mode
  :ensure t
  :hook
  (rust-mode . (lambda ()
		 (setq indent-tabs-mode nil)))
  :config
  ;;
  ;; Enable auto format on save.
  ;;
  (setq rust-format-on-save t))
(provide 'init-rust)
;;; init-rust.el ends here
