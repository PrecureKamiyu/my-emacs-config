;;; package --- Summary -*- lexical-binding: t -*-
;;; Commentary:
;;; use $ sbcl --eval '(ql:quickload :quicklisp-slime-helper)' --quit
;;; to install slime
;;; Code:
(load (expand-file-name "~/.quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")

(provide 'init-slime)
;;; init-proxy.el ends here
