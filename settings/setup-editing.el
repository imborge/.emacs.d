(setq tab-width 2)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

(add-hook 'after-init-hook 'global-company-mode)

(provide 'setup-editing)
