;;; init-helm --- init file for helm -*- lexical-binding: t -*-
;;; Commentary:
;;; I use this only for find files and imenu
;;; Code:
(use-package helm
  :config
  ;;
  ;;
  ;;
  (setq helm-M-x-show-short-doc t)
  ;;
  ;; change key for helm imenu and file files
  ;;
  (global-set-key (kbd "C-x b") 'helm-mini)
  (global-set-key (kbd "C-x C-b") 'helm-buffers-list)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "M-g i") 'helm-imenu))
(use-package helm-posframe
  :config
  ;;
  ;; You may enable more configuration
  ;;
  (setq helm-posframe-border-width 1)
  ;; (setq helm-posframe-width 110)
  ;;
  (helm-posframe-enable))
(provide 'init-helm)
;;; init-helm.el ends here
