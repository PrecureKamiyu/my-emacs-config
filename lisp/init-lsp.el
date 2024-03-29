;;; init-lsp --- init for lsp bridge -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(add-to-list 'load-path "~/.emacs.d/lisp/lsp-bridge")
(add-to-list 'load-path "~/.emacs.d/lisp/blink-search")
(use-package lsp-bridge
  :hook ((prog-mode . lsp-bridge-mode)))
(use-package lsp-ui
  :bind (:map lsp-ui-mode-map
	      ("C-c C-i" . lsp-ui-imenu))
  :hook ((prog-mode . lsp-ui-mode)))
(provide 'init-lsp)
;;; init-lsp.el ends here
