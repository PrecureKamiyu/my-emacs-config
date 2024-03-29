;;; package --- Summary -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package blink-search
  :bind (("C-c b" . blink-search))
  :config
  (setq blink-search-enable-posframe t))

(provide 'init-blink-search)
;;; init-blink-search.el ends here
