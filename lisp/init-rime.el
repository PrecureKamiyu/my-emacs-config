;;; package --- Summary -*- lexical-binding: t -*-

;;; Commentary:
;;;
;;; to use Emacs rime, just follow the instruction of the Emacs rime
;;; page and rime as a backend application can be used in some of the
;;; system if indeed your system can run rime, remember to configure
;;; it in ~/.config/fcitx/rime to enable some feature, for example
;;; simplied Chinese

;;; Code:

(use-package rime
  :custom
  (default-input-method "rime")
  (rime-disable-predicates
   '(;;
     ;; use when evil mode other than insert
     ;;
     ;; rime-predicate-evil-mode-p
     ;;
     ;; use when right after Eng char
     ;;
     rime-predicate-after-alphabet-char-p
     ;;
     ;; use when inputing uppercase
     ;;
     rime-predicate-current-uppercase-letter-p
     ;;
     ;; use when in tex math mode
     ;;
     rime-predicate-tex-math-or-command-p
     ;;
     ;; use when in prog mode
     ;; rime-predicate-prog-in-code-p
     ;; use when after kanji space
     rime-predicate-space-after-cc-p))
  (rime-show-candidate 'posframe)
  :config
  (setq rime-user-data-dir "~/.emacs.d/rime/"))

(provide 'init-rime)
;;; init-rime.el ends here
