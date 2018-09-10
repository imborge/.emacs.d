(defun add-language-pragma ()
  (interactive)
  (evil-insert 1) ;; Put in insert mode
  (goto-char 0) ;; Go to start of file
  (insert "{-# LANGUAGE  #-}\n") ;; Insert text
  (goto-char 14)) ;; Put cursor in place where language extensions should be

(defun add-overloaded-strings ()
  (interactive)
  (let ((p (point))
        (s "{-# LANGUAGE OverloadedStrings #-}\n"))
    (evil-insert 1)
    (goto-char 0)
    (insert s)
    (goto-char (+ p (length s)))))

(add-hook 'haskell-mode-hook
  (lambda ()
    (local-set-key (kbd "C-x C-å +") 'add-language-pragma)))

(add-hook 'haskell-mode-hook
  (lambda ()
    (local-set-key (kbd "C-x C-å s"))))