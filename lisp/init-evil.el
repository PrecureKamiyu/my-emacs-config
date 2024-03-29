;;; init-evil --- init for evil the vim emulator -*- lexical-binding: t -*-
;;;
;;; Commentary:
;;;
;;; Code:
(use-package evil
  :config
  (evil-mode 1)
  ;;
  ;; use `C-e' as emacs keybind in insert state and normal state.  Use
  ;; visual next line and previous line.
  ;;
  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
  (define-key evil-insert-state-map (kbd "C-e") 'end-of-line)
  (define-key evil-insert-state-map (kbd "C-a") 'move-beginning-of-line)
  (define-key evil-insert-state-map (kbd "C-n") 'evil-next-line)
  (define-key evil-insert-state-map (kbd "C-p") 'evil-previous-line)
  (define-key evil-normal-state-map (kbd "C-e") 'end-of-line))

(provide 'init-evil)
;;; init-evil.el ends here
