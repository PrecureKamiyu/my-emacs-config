;;; init-marginalia --- init for marginalia to enable rich annotations in M-x
;;; Commentary:
;;; Code:
(use-package marginalia
  ;; Bind `marginalia-cycle' locally in the minibuffer.  To make the binding
  ;; available in the *Completions* buffer, add it to the
  ;; `completion-list-mode-map'.
  :bind (:map minibuffer-local-map
         ("M-A" . marginalia-cycle))

  ;; The :init section is always executed.
  :init
  ;; Marginalia must be activated in the :init section of use-package
  ;; such that the mode gets enabled right away. Note that this forces
  ;; loading the package.
  (marginalia-mode))

(provide 'init-marginalia)
