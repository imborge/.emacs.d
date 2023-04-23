;;; setup-rust.el -- Description
;;; Commentary:
;;; Code:

(require 'rust-mode)

(add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))

(setq rust-format-on-save t)

(provide 'setup-rust)
;;; setup-rust.el ends here
