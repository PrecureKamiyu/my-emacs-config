(use-package sort-tab
  ;; becareful that calling sort-tab-mode multiple times
  ;; will leads to trouble
  :config
  (sort-tab-mode 1)
  (global-set-key (kbd "M-]") 'sort-tab-select-next-tab)
  (global-set-key (kbd "M-[") 'sort-tab-select-prev-tab)
  (global-set-key (kbd "M-1") 'sort-tab-select-visible-tab)
  (global-set-key (kbd "M-2") 'sort-tab-select-visible-tab)
  (global-set-key (kbd "M-3") 'sort-tab-select-visible-tab)
  (global-set-key (kbd "M-4") 'sort-tab-select-visible-tab)
  (global-set-key (kbd "M-5") 'sort-tab-select-visible-tab)
  (global-set-key (kbd "M-6") 'sort-tab-select-visible-tab)
  (global-set-key (kbd "M-7") 'sort-tab-select-visible-tab)
  (global-set-key (kbd "M-8") 'sort-tab-select-visible-tab)
  (global-set-key (kbd "M-9") 'sort-tab-select-visible-tab)
  (global-set-key (kbd "M-0") 'sort-tab-select-visible-tab)
  (global-set-key (kbd "C-;") 'sort-tab-close-current-tab))
(provide 'init-sort-tab)
