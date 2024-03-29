;;; init-winner --- init file for winner mode
;;; Commentary:
;;; Code:
(use-package winner
  :config (winner-mode)
  :bind (:map winner-mode-map
	      ("C-c h" . winner-undo)
	      ("C-c l" . winner-redo)))

(provide 'init-winner)
;;; init-winner.el ends here
