;;; setup-typescript.el -- Typescript setup

;;; Commentary:

;;; Code:
(require 'typescript-mode)
(require 'tree-sitter)
(require 'flycheck)
(require 'company)

(define-derived-mode typescriptreact-mode typescript-mode
  "TypeScript TSX")

;; use our derived mode for tsx files
(add-to-list 'auto-mode-alist '("\\.tsx?\\'" . typescriptreact-mode))
;; by default, typescript-mode is mapped to the treesitter typescript parser
;; use our derived mode to map both .tsx AND .ts -> typescriptreact-mode -> treesitter tsx
(add-to-list 'tree-sitter-major-mode-language-alist '(typescriptreact-mode . tsx))

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

;; tsx
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
;; enable typescript-tslint checker
(flycheck-add-mode 'typescript-tslint 'web-mode)

(provide 'setup-typescript)
;;; setup-typescript.el ends here
