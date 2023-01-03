;;; setup-html.el -- HTML setup
;;; Commentary:
;;;   See setup-web-mode.el
;;; Code:
(require 'sgml-mode)
(require 'smartparens)

(defun my-html-mode-hook ()
  (smartparens-mode 1)
  (define-key html-mode-map (kbd "C-k") 'sp-kill-sexp))

(add-hook 'html-mode-hook 'my-html-mode-hook)

(provide 'setup-html)
;;; setup-html.el ends here
