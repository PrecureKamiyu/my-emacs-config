;;; package --- Summary -*- lexical-binding: t -*-
;;; Comment: this file should be loaded after `init-evil.el'
(require 'color-rg)

(use-package color-rg
  :bind
  (("C-c c" . 'color-rg-search-input))
  ;; :config
  ;; (evil-set-initial-state 'color-rg-mode 'emacs)
  )

(provide 'init-color-rg)
;;; init-color-rg.el ends here
