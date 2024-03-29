;;; init-leetcode --- init file for leetcode client -*- lexical-binding: t -*-
;;; Commentary:
;;;
;;; https://github.com/kaiwk/leetcode.el
;;;
;;; This package use a cookie detection program to detect the current
;;; available cookies to login to the leetcode.  You should login
;;; leetcode in browser before using this package.  Usage: run M-x
;;; leetcode to open the main panel Because of the evil configuration,
;;; this file should be loaded after evil has loaded.
;;;
;;; leetcode-solution-mode is a minor mode where you input your
;;; answer.  In this mode, use C-c C-t to run the test; and use C-c
;;; C-s to submit; use C-c C-r to restore window layout
;;;
;;; Usage:
;;;
;;; in the problem set buffer, use L to change the prefer language.
;;;
;;; Code:
(use-package leetcode
  :config
  ;;
  ;; the evil related configuration
  ;;
  ;; (evil-set-initial-state 'leetcode-solution-mode 'emacs)
  ;; (evil-set-initial-state 'leetcode--problem-detail-mode 'emacs)
  ;; (evil-set-initial-state 'leetcode--problems-mode 'emacs)
  ;;
  ;; set prefer language.  The language available can be seen in
  ;; leetcode-lang-prefix
  ;;
  (setq leetcode-prefer-language "cpp")
  ;;
  ;; saving your answer
  ;;
  (setq leetcode-save-solutions t)
  (setq leetcode-directory "~/leetcode"))

;;; init-leetcode.el ends here
