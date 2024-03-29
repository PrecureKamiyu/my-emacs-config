;;; init-projectile --- init for projectile -*- lexical-binding: t -*-
;;;
;;; Commentary:
;;;
;;; the org mode configuration is in else where.
;;;
;;; Code:
(use-package projectile
  :ensure t
  :init (projectile-mode +1)
  :bind (:map projectile-mode-map
	      ("C-c p" . projectile-command-map)))
(setq projectile-project-search-path '("~/projects/"))
(provide 'init-projectile)
;;; init-projectile.el ends here
