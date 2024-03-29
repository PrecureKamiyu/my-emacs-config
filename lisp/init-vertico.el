;;; package --- Summary -*- lexical-binding: t -*-
;; vertico and orderless

(use-package orderless
  :config
  (setq completion-styles '(orderless)))

(use-package vertico
  ;; :bind (:map vertico-map
  ;; 	      ("RET" . vertico-directory-enter)
  ;; 	      ("DEL" . vertico-directory-delete-word)
  ;; 	      ("M-d" . vertico-directory-delete-char))
  :config
  (vertico-mode))

(define-key vertico-map (kbd "RET") 'vertico-directory-enter)
(define-key vertico-map (kbd "DEL") 'vertico-directory-delete-word)
(define-key vertico-map (kbd "M-d") 'vertico-directory-delete-char)

(provide 'init-vertico)
;;; init-vertico.el ends here
