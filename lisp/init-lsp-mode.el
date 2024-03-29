;;; package --- Summary -*- lexical-binding: t -*-
;;;
;;; Commentary:
;;;
;;; Configuring company mode in this file because lsp-bridge does not
;;; need company-mode check https://company-mode.github.io/ for more
;;; company configuring.
;;;
;;; Code:
;;
;; use flycheck for giving suggestions.  flycheck is said to be more
;; modern than flymake.
;;
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode))
;;
;; The following two packages are for the popup message for flycheck
;; the flycheck-popup-tip looks more comfortable
;;
;; (use-package flycheck-pos-tip
;;   :ensure t
;;   :after (flycheck)
;;   :config
;;   (with-eval-after-load 'flycheck
;;     (flycheck-pos-tip-mode)))
(use-package flycheck-popup-tip
  :ensure t
  :after (flycheck)
  ;;
  ;; currently I dont use popup-tip because flycheck supports that.
  ;;
  ;;:hook ((flycheck-mode . flycheck-popup-tip-mode))
)
;;
;; lsp-mode
;;
(use-package lsp-mode
  :init
  ;;
  ;; since you can't use super key
  ;; lsp keymap prefix is quite different from other
  ;;
  (setq lsp-keymap-prefix "C-c i")
  :bind (:map lsp-mode-map
	      ("C-]" . 'lsp-find-definition))
  :hook
  ;;
  ;; again I manually add hooks for pratical reasons
  ;;
  ((c++-ts-mode . lsp)
   (rust-mode . lsp))
  :config
  ;;
  ;; hide headerline by default
  ;;
  (setq lsp-headerline-breadcrumb-enable nil)
  ;;
  ;; you may use it if you are not using company-mode.  It will touch
  ;; other company backends.  So I set it to none.  But you should
  ;; configure company mode to let it support lsp.
  ;;
  (setq lsp-completion-provider :none)
  ;;
  ;; enable which key plugin
  ;; to show keymap candidates
  ;;
  (lsp-enable-which-key-integration t)
  ;;
  ;; disable the lsp-rust-analyzer-lens for practical reason
  ;; that is, I don't use this shit
  ;;
  (setq lsp-rust-analyzer-lens-enable nil)
  ;;;
  ;;; the `golang' configuring
  ;;;
  (add-hook 'go-mode-hook #'lsp-deferred)
  ;; Set up before-save hooks to format buffer and add/delete imports.
  ;; Make sure you don't have other gofmt/goimports hooks enabled.
  (defun lsp-go-install-save-hooks ()
    (add-hook 'before-save-hook #'lsp-format-buffer t t)
    (add-hook 'before-save-hook #'lsp-organize-imports t t))
  (add-hook 'go-mode-hook #'lsp-go-install-save-hooks)
  )
;;
;;
;;
(use-package lsp-ui-doc
  :bind (("C-c d" . 'lsp-ui-doc-toggle))
  :config
  (setq lsp-ui-doc-include-signature t
	lsp-ui-doc-position 'top))
;;
;; company means complete anything
;; which is more modern than ac
;;
(use-package company
  ;;
  ;; todo to set the keybind for backends
  ;;
  :config
  ;;
  ;; The next two are default value.
  ;;
  (setq company-idle-delay 0.3)
  ;;
  ;; Length is set to one.  It will cause some trouble, but for the
  ;; sake of programming experience.
  ;;
  (setq company-minimum-prefix-length 1)
  (setq company-transformers '(company-sort-by-backend-importance))
  ;; install backends yourself.
  (setq company-backends '((company-yasnippet company-capf company-go company-shell)))
  :bind (:map company-active-map
	      ;;
	      ;; I use `M-n' and `M-p' for cursor moving.
	      ;;
	      ("M-n" . 'company-select-next)
	      ("M-p" . 'company-select-previous-or-abort))
  :bind(:map company-mode-map
	     ;;
	     ;;
	     ;;
	     ("<backtab>" . 'company-complete))
  ;;
  ;; I manually add hooks because in some situations company mode will
  ;; drag down performance
  ;;
  :hook ((emacs-lisp-mode . company-mode)
	 (c++-ts-mode . company-mode)
	 (c++-mode . company-mode)
	 (rust-ts-mode . company-mode)
	 (rust-mode . company-mode)
	 (go-mode . company-mode)
	 (go-ts-mode . company-mode)))
(provide 'init-lsp-mode)
;;; init-lsp-mode.el ends here
