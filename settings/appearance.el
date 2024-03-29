;;; appearance.el -- Settings for appearance
;;; Commentary:
;;; Code:
(setq font-lock-maximum-decoration t
      truncate-partial-width-windows nil)

;; Dont beep, Dont visible bell. Just blink the modeline on errors
(setq visible-bell nil)
(setq ring-bell-function (lambda ()
                           (invert-face 'mode-line)
                           (run-with-timer 0.05 nil 'invert-face 'mode-line)))

;; Highlight current line
;; (global-hl-line-mode 1)


;; Set custom theme path
(setq custom-theme-directory (concat user-emacs-directory "themes"))

(dolist
    (path (directory-files custom-theme-directory t "\\w+"))
  (when (file-directory-p path)
    (add-to-list 'custom-theme-load-path path)))

(defun use-default-theme ()
  "Load the default theme."
  (interactive)
  (load-theme 'spacemacs-light))

(use-default-theme)

;; Highlight matching parentheses when the point is on them
(show-paren-mode 1)

;; Rainbow delimiters
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (blink-cursor-mode -1))

;; Make zooming affect frame instead of buffers
;;(require 'zoom-frm)

;; Change font to Iosevka
(add-to-list 'default-frame-alist '(font . "Fira Code"))
(set-face-attribute 'default t :font "Fira Code")

(provide 'appearance)
;;; appearance.el ends here
