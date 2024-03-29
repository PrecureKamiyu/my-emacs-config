;;; package --- Summary -*- lexical-binding: t -*-

;;; Commentary:
;;; 1. major mode rempa alist is just ad hoc solution.
;;; 2. some keymap is not avaiable in respective -ts-mode. Some of them
;;;    are added manually
;;; 3. font-lock-level seems to be some kind of bug.

;;; Code:

;;
;; specify the source of language
;;
;; You may manually compile gomod treesit.
;;
(setq treesit-language-source-alist
   '((bash "https://github.com/tree-sitter/tree-sitter-bash")
     (cpp "https://github.com/tree-sitter/tree-sitter-cpp")
     (c "https://github.com/tree-sitter/tree-sitter-c")
     (rust "https://github.com/tree-sitter/tree-sitter-rust")
     (cmake "https://github.com/uyha/tree-sitter-cmake")
     (css "https://github.com/tree-sitter/tree-sitter-css")
     (elisp "https://github.com/Wilfred/tree-sitter-elisp")
     (go "https://github.com/tree-sitter/tree-sitter-go")
     (html "https://github.com/tree-sitter/tree-sitter-html")
     (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
     (json "https://github.com/tree-sitter/tree-sitter-json")
     (make "https://github.com/alemuller/tree-sitter-make")
     (markdown "https://github.com/ikatyang/tree-sitter-markdown")
     (python "https://github.com/tree-sitter/tree-sitter-python")
     (toml "https://github.com/tree-sitter/tree-sitter-toml")
     ;; typst newly added for typst-ts-mode
     (typst "https://github.com/uben0/tree-sitter-typst")
     (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
     (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
     (yaml "https://github.com/ikatyang/tree-sitter-yaml")))
;;
;; use major mode remap to use -ts-mode everywhere
;;
(use-package treesit
  ;; :bind (:map rust-ts-mode-map
  ;; 	      ("C-c C-r" . rust-run)
  ;; 	      ("C-c C-t" . rust-test))
  :config
  (setq treesit-font-lock-level 4)
  (setq major-mode-remap-alist
	'((bash-mode . bash-ts-mode)
	  (c-mode . c-ts-mode)
	  (c++-mode . c++-ts-mode)
	  (rust-mode . rust-ts-mode)
	  (go-mode . go-ts-mode))))
;; (define-key rust-ts-mode-map (kbd "C-c C-r") 'rust-run)
;; (define-key rust-ts-mode-map (kbd "C-c C-t") 'rust-test)

;;
;; This line will add a hook when you open go-ts-mode.  The added hook
;; will enable gofmt-before-save.  And of course, function
;; gofmt-before-save is an interactive function, you can enable it yourself.
;;
;; (add-hook 'go-ts-mode-hook (lambda ()
			     ;; (add-hook 'before-save-hook 'gofmt)))

(provide 'init-tree-sitter)
;;; init-tree-sitter.el ends here
