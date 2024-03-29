;;; init-hydra --- init file for hydra
;;;
;;; Commentary:
;;;
;;; Code:
(use-package hydra
  :config
  (defhydra hydra-zoom (global-map "<f3>")
    "zoom"
    ("g" text-scale-increase "in")
    ("l" text-scale-decrease "out")))
(provide 'init-hydra)
;;; init-hydra.el ends here
