(require 'smartparens)

(defun my-html-mode-hook ()
  (smartparens-mode 1)
  (define-key html-mode-map (kbd "C-k") 'sp-kill-sexp))

(add-hook 'html-mode-hook 'my-html-mode-hook)

(provide 'setup-html)
