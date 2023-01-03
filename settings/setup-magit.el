;;; setup-magit.el -- Magit setup
;;; Commentary:
;;; Code:
(require 'vc-annotate)

(defun magit-status-fullscreen (prefix)
  "Full screen magit-status.  PREFIX: buffer prefix."
  (interactive "P")
  (magit-status)
  (unless prefix
    (delete-other-windows)))

;; don't prompt me

(set-default 'magit-push-always-verify nil)
(set-default 'magit-revert-buffers 'silent)
(set-default 'magit-no-confirm '(stage-all-changes
                                 unstage-all-changes))

;; move cursor into position when entering commit message

(defun my/magit-cursor-fix ()
  "Move cursor into position when entering commit message."
  (goto-char (point-min))
  (when (looking-at "#")
    (forward-line 2)))

(add-hook 'git-commit-mode-hook 'my/magit-cursor-fix)

;; full screen vc-annotate

(defun vc-annotate-quit ()
  "Restore the previous window configuration and kill the `vc-annotate` buffer."
  (interactive)
  (kill-buffer)
  (jump-to-register :vc-annotate-fullscreen))

(eval-after-load "vc-annotate"
  '(progn
     (defadvice vc-annotate (around fullscreen activate)
       (window-configuration-to-register :vc-annotate-fullscreen)
       ad-do-it
       (delete-other-windows))

     (define-key vc-annotate-mode-map (kbd "q") 'vc-annotate-quit)))

(set-default 'magit-diff-refine-hunk t)

;; update diff-hl

(global-diff-hl-mode)
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

(provide 'setup-magit)
;;; setup-magit.el ends here
