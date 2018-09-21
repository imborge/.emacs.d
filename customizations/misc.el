;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

;; No need for ~ files when editing
(setq create-lockfiles nil)

;; Go straight to scratch buffer on startup
(setq inhibit-startup-message t)

(global-unset-key "\C-z")

(require 'which-key)
(which-key-mode)

; Map escape to cancel (like C-g)...
;; (global-set-key [escape] 'keyboard-quit)
;; (define-key isearch-mode-map [escape] 'isearch-abort)   ;; isearch
;; (define-key isearch-mode-map "\e" 'isearch-abort)   ;; \e seems to work better for terminals
;; (global-set-key [escape] 'keyboard-escape-quit)         ;; everywhere else
