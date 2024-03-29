;;; init-aas --- init for aas -*- lexical-binding: t -*-
;;;
;;; Commentary:
;;;
;;; This package actually uses texmathp package as in auctex to detect
;;; whether it is tex math mode at point.
;;;
;;; Code:
(use-package aas
  :hook (LaTeX-mode . aas-activate-for-major-mode)
  :hook (org-mode .     aas-activate-for-major-mode)
  :hook (rust-ts-mode . aas-activate-for-major-mode)
  :hook (typst-ts-mode . aas-activate-for-major-mode)
  :config
  (aas-set-snippets 'org-mode
 		    ;; an example using looking back
		    :cond #'(lambda () (looking-back "^" nil))
		    "beg" '(yas "\\begin{$1}\n$2\n\\end{$1}")
		    "equ" '(yas "\\begin{equation}\n$1\n\\end{equation}")
		    :cond #'(lambda () (not (texmathp)))
		    "lm" '(yas "\\\\($1\\\\)$0")
		    "dm" '(yas "\\[\n$1\n\\]$0")
		    "sim" "~"
		    ;; an example using texmathp
		    :cond #'texmathp
		    "ff" '(yas "{$1 \\over $2}$0")
		    ;; symbols
		    "==>" "\\Longrightarrow"
		    "-->" "\\longrightarrow"
		    "::" "\\colon"
		    "..." "\\dots"
		    ;; greeks
		    "@a" "\\alpha"
		    "@b" "\\beta"
		    "@w" "\\omega"
		    )
  (aas-set-snippets 'rust-ts-mode
		    "ifs" '(yas "if ${1:true} {\n$0\n}")
		    "ifl" '(yas "if let $1 {\n$0\n}")
    )
  ;; (aas-set-snippets 'c++-ts-mode
		    ;; "lcpre" "class Solution {\npublic:\n  $0\n};")
  (aas-set-snippets 'text-mode
		    ;; expand unconditionally
		    ";o-" "ō"
		    ";i-" "ī"
		    ";a-" "ā"
		    ";u-" "ū"
		    ";e-" "ē")
  (aas-set-snippets 'typst-ts-mode
    "lm" '(yas "$$1$")
    "dm" '(yas "$ $1 $")
    ";e-" "ē")
  (aas-set-snippets 'latex-mode
		    ;; set condition!
		    "lm" '(yas "\\\\($1\\\\)$0")
		    "dm" '(yas "\\[\n$1\n\\]$0")
		    :cond #'(lambda () (looking-back "^" nil))
		    "beg" '(yas "\\begin{$1}\n$0\n\\end{$1}")
		    :cond #'texmathp ; expand only while in math
		    "Olon" "O(n \\log n)"
		    ;; Use YAS/Tempel snippets with ease!
		    ";ig" #'insert-register
		    ";call-sin"
		    (lambda (angle)
		      (interactive "sAngle: ")
		      (insert (format "%s" (sin (string-to-number angle))))))
  ;; disable snippets by redefining them with a nil expansion
  (aas-set-snippets 'latex-mode
		    "supp" nil))

(provide 'init-aas)
;;; init-aas.el ends here
