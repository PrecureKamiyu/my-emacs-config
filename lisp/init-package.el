;;; init-package --- init for packages -*- lexical-binding: t -*-
;;;
;;; Commentary:
;;;
;;; Path: sort-tab, auto-save, aweshell, lsp-bridge and so on.  Change
;;; the behavior of C-x 1.  Github plugin is shown in the 'load-path.
;;;
;;; Code:
(require 'package)
(require 'use-package)
;;
;; this line of code is used to enable external org mode
;;
;; (use-package org
;;   :load-path "~/projects/org-mode/lisp")

;;
;; most of these are plugin directories from github
;;
(add-to-list 'load-path "~/.emacs.d/lisp/sort-tab")
(add-to-list 'load-path "~/.emacs.d/lisp/auto-save")
(add-to-list 'load-path "~/.emacs.d/lisp/aweshell")
(add-to-list 'load-path "~/.emacs.d/lisp/lsp-bridge")
(add-to-list 'load-path "~/.emacs.d/lisp/color-rg")
(add-to-list 'load-path "~/.emacs.d/lisp/blink-search")
(add-to-list 'load-path "~/.emacs.d/lisp/auto-activating-snippets")
(add-to-list 'load-path "~/.emacs.d/lisp/typst-ts-mode")
(add-to-list 'load-path "~/.emacs.d/lisp/neotree")
;;
;; add package archives
;;
(custom-set-variables
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("nongnu" . "https://elpa.nongnu.org/nongnu/")
     ("melpa" . "https://melpa.org/packages/")
     ("melpa-stable" . "https://stable.melpa.org/packages/"))))

;; (setq package-archives '(("gnu"   . "http://1.15.88.122/gnu/")
                           ;; ("melpa" . "http://1.15.88.122/melpa/")))

;; ========================================================
(use-package neotree)
(use-package hl-todo
  :hook (prog-mode . hl-todo-mode))
;;
;; xwwwp needs xwidget configure options, of course.
;;
(use-package xwwp)
;;
;;
;; olivetti
;;
(use-package olivetti
  :hook (org-mode . olivetti-mode)
  :hook (markdown-mode . olivetti-mode))
;;
;;
;; pdf tools configuration
;;
(use-package pdf-tools
  :config
  (pdf-tools-install)
  (add-to-list 'auto-mode-alist '("\.pdf\'" . pdf-view-mode)))
;;
;; Save session.
;;
(use-package desktop
  :init (desktop-save-mode 1)
  :config
  (setq desktop-buffers-not-to-save "*sort-tab*")
  (setq desktop-path '("~/.emacs.d/workspace")))
;;
;; Don't delete sort-tab.  Sort-tab can not be deleted back then.  But
;; desktop.el reverse this fact.
;;
(defun safe-delete-other-windows ()
  "Delete other windows but spare some."
  (interactive)
  (let ((current-window (selected-window)))
    (dolist (window (window-list))
      (unless (or (equal current-window window)
                  (equal "*sort-tab*" (buffer-name (window-buffer window))))
        (delete-window window)))))
;;
;; Very ugly.
;;
(global-set-key (kbd "C-x 1") 'safe-delete-other-windows)
;;
;; auto-save is a plugin from github.  auto save files.
;;
(use-package auto-save
  :config
  (auto-save-enable)
  :custom
  (auto-save-silent t)
  (auto-save-delete-trailing-whitespace t))
;;
;; A very important utility to show candidates ofkeymap
;; in minibuffer.
;;
(use-package which-key
  :init
  (which-key-mode))
;;
;; A more neat tray.
;;
(use-package awesome-tray
  :config
  (awesome-tray-mode)
  (setq awesome-tray-active-modules
	'("input-method" "buffer-name" "belong" "mode-name" "date")))
;;
;; Automatically pair parentheses
;;
(electric-pair-mode t)
;;
;; terminal emulator
;;
(use-package eat
  :config
  (setq eat-kill-buffer-on-exit t)
  (setq eat-enable-mouse t))
;;
;; Here is some language modes.
;;
(use-package markdown-mode
  :hook (markdown-mode . auto-fill-mode)
  ;; :hook (markdown-mode . markdown-toggle-markup-hiding)
  :config
  ;;
  ;; Render the code block with highlight in markdown.
  ;;
  (setq markdown-fontify-code-blocks-natively t))
;;==================
;; language mode section
(require 'init-rust)
(require 'init-lean4)
;;
;; Snippet
;;
(require 'init-yasnippet)
;;
;; Auto-activate snippet.
;;
(require 'init-aas)
;;
;; Enhanced find file, M-x, buffer list, and so on.
;;
(require 'init-helm)
;;
;; Better project.el.
;;
(require 'init-projectile)
;;
;; Typst-ts-mode major mode.
;;
(require 'init-typst)
;;
;; rime is an input method
;;
;; load rime when you need it.
;;
;; (require 'init-rime)
;;
;; lsp-bridge is in init-lsp.  lsp-mode is in init-lsp-mode.  the
;; former is faster, but the latter has more community support.
;;
;; (require 'init-lsp)
(require 'init-lsp-mode)
;;
;; Search buffer content, buffer list, recent files.
;;
(require 'init-blink-search)
;;
;; Search content of file and replace.
;;
(require 'init-color-rg)
(require 'init-aweshell)
;;
;; windmove configuration.  windmove is a built-in package.  Since
;; evil map is not available in all modes.
;  (evil-set-initial-state 'eshell-mode 'emacs));
(use-package windmove
  :init (windmove-mode 1)
  :bind (("M-p h" . windmove-left)
	 ("M-p l" . windmove-right)
	 ("M-p j" . windmove-down)
	 ("M-p k" . windmove-up)))
;;
;; candidates and annotations in minibuffer.
;; vertico is for candidates.
;; marginalia is for annotations.
;;
(require 'init-vertico)
(require 'init-marginalia)
;;
(provide 'init-package)
;;; init-package.el ends here
