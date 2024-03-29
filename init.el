;;; init --- init file for emacs -*- lexical-binding: t -*-
;;;
;;; Commentary:
;;;
;;; Code:

(add-to-list 'load-path "~/.emacs.d/lisp/")
;; -----------------
(let (;; 加载的时候临时增大`gc-cons-threshold'以加速启动速度。
      (gc-cons-threshold most-positive-fixnum)
      ;; 清空避免加载远程文件的时候分析文件。
      (file-name-handler-alist nil))

  ;; Emacs配置文件内容写到下面.
  ;; (use-package org
    ;; :load-path "~/projects/org-mode/lisp")

  (require 'init-ui)
  (require 'init-package)
  ;;
  ;; keymap after loading init-package
  ;; `<backtab>' force company-complete
  ;;
  ;; `C-]'     lsp-find-definition in lsp mode
  ;; `C-c c'   color-rg-search-input
  ;; `C-c b'   blink search
  ;; `C-c i'   lsp command map prefix
  ;; `C-c h'   winner left, l for right respectively
  ;; `C-c d'   lsp ui doc toggle (for hover annotations)
  ;; `C-c C-t' with number prefix to select tab bar, in non-org mode
  ;; `C-x x'   helm find fils
  ;; `C-x b'   helm buffer list
  ;; `C-x C-b' helm buffers list
  ;; `M-p'     the windmove prefix
  ;; `M-x'     helm M-x
  ;;
  (require 'init-better-default)
  (require 'init-proxy)
  (require 'init-tree-sitter)
  (require 'init-org)
  (require 'init-manually))
;;; init.el ends here
