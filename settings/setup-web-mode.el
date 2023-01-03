;;; setup-web-mode.el -- Web-mode setup
;;; Commentary:
;;; Code:
(require 'web-mode)

(defun my-web-mode-hook ()
  "Hooks for web mode."
  (setq web-mode-code-indent-offset 2))

(add-hook 'web-mode-hook 'my-web-mode-hook)

(provide 'setup-web-mode)
;;; setup-web-mode.el ends here
