;;; setup-emojis.el -- Emoji setup
;;; Commentary:
;;; Code:
(require 'emojify)

;; Setup font for emojis
(when (member "Noto Color Emoji" (font-family-list))
  (set-fontset-font
   t 'symbol (font-spec :family "Noto Color Emoji") nil 'prepend))

(setq emojify-display-style 'unicode)
;;(setq emojify-emojy-styles '(unicode))

(emojify-set-emoji-styles '(unicode))

(provide 'setup-emojis)
;;; setup-emojis.el ends here
