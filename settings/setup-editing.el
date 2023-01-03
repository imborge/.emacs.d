;;; setup-editing.el -- Editing setup
;;; Commentary:
;;; Code:
(require 'dash)

(setq tab-width 2)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

(add-hook 'after-init-hook 'global-company-mode)
; (add-hook 'company-mode-hook 'company-box-mode)

(require 'tree-sitter)
(require 'tree-sitter-hl)
(require 'tree-sitter-langs)
(require 'tree-sitter-debug)
(require 'tree-sitter-query)

(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))

(provide 'setup-editing)
;;; setup-editing.el ends here
