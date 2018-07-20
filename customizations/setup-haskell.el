(defun add-language-pragma ()
  (interactive)
  (evil-insert 1) ;; Put in insert mode
  (goto-char 0) ;; Go to start of file
  (insert "{-# LANGUAGE  #-}\n") ;; Insert text
  (goto-char 14)) ;; Put cursor in place where language extensions should be


(add-hook 'haskell-mode-hook
  (lambda ()
    (local-set-key (kbd "C-x C-å") 'add-language-pragma)))
