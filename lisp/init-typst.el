;;; package --- Summary -*- lexical-binding: t -*-
;;;
;;; Commentary:
;;;
;;; Code:
;;
(use-package typst-ts-mode
  :custom
  ;; don't add "--open" if you'd like `watch` to be an error detector
  (typst-ts-mode-watch-options "--open"))
(provide 'init-typst)
;;; init-typst.el ends here
