(require 'evil)
;; Expand region
(global-set-key (kbd "C-'") 'er/expand-region)

;; Smart M-x
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(global-set-key (kbd "C-ø") 'ace-jump-mode)

;; Transpose stuff
(global-unset-key (kbd "M-t"))
(global-set-key (kbd "M-t l") 'transpose-lines)
(global-set-key (kbd "M-t w") 'transpose-words)
(global-set-key (kbd "M-t s") 'transpose-sexps)
(global-set-key (kbd "M-t p") 'transpose-params)

;; Query replace regex
(global-set-key (kbd "M-&") 'query-replace-regexp)

;; Comment/uncomment block
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c u") 'comment-region)

;; Eval buffer
(global-set-key (kbd "C-c C-k") 'eval-buffer)

;; Magit
(global-set-key (kbd "C-x m") 'magit-status-fullscreen)
(autoload 'magit-status-fullscreen "magit")

;; Clever newlines
(global-set-key (kbd "C-o") 'open-line-and-indent)
(global-set-key (kbd "<C-return>") 'open-line-below)
(global-set-key (kbd "<C-S-return>") 'open-line-above)
(global-set-key (kbd "<M-return>") 'new-line-dwim)

;; Duplicate region
(global-set-key (kbd "C-c d") 'duplicate-current-line-or-region)

;; Line movement
(global-set-key (kbd "<C-S-down>") 'move-text-down)
(global-set-key (kbd "<C-S-up>") 'move-text-up)

;; Toggle quotes
(global-set-key (kbd "C-\"") 'toggle-quotes)

;; Sorting
(global-set-key (kbd "M-s l") 'sort-lines)

;; Increase number at point (or other change based on prefix arg)
(global-set-key (kbd "C-+") 'change-number-at-point)
(global-set-key (kbd "C-?") 'subtract-number-at-point)
(eval-after-load 'undo-tree '(define-key undo-tree-map (kbd "C-?") nil))

;; Browse the kill ring
(global-set-key (kbd "C-x C-y") 'browse-kill-ring)

;; Remove suspend keybinding
(global-unset-key (kbd "C-z"))

;; Insert chars in evil normal mode
(evil-define-command my-evil-insert-lambda ()
  (evil-append 0)
  (insert "λ")
  (evil-normal-state))

(evil-define-command my-evil-insert-copyright ()
  (evil-append 0)
  (insert "©")
  (evil-normal-state))

;; (define-key evil-normal-state-map (kbd "SPC i c l") 'my-evil-insert-lambda)
;; (define-key evil-normal-state-map (kbd "SPC i c c") 'my-evil-insert-copyright)

(provide 'key-bindings)
