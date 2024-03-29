;;; init.el -- imborge's emacs config

;;; Commentary:

;;; Code:

;; Better defaults
(add-to-list 'load-path
             (expand-file-name "better-defaults" user-emacs-directory))

(require 'better-defaults)

;; No splash screen
(setq inhibit-startup-message t)

;; Set path to deps
(setq site-lisp-dir
      (expand-file-name "site-lisp" user-emacs-directory))

(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))


;; Set up load path
(add-to-list 'load-path settings-dir)
(add-to-list 'load-path site-lisp-dir)

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Setup appearance early

;; Settings for currently logged in user
(setq user-settings-dir
      (concat user-emacs-directory "users/" user-login-name))
(add-to-list 'load-path user-settings-dir)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

;; Setup packages
(require 'setup-package)

(defun init--install-packages ()
  "Install packages if they are missing."
  (packages-install
   '(ace-jump-mode
     auctex
     browse-kill-ring
     cider
     clojure-mode
     clojure-mode-extra-font-locking
     clj-refactor
     ;;copilot
     company
     company-box
     css-eldoc
     dante
     diff-hl
     editorconfig
     emojify
     expand-region
     flutter
     flx
     flx-ido
     flycheck
     flycheck-clj-kondo
     flycheck-pos-tip
     haskell-mode
     ido-at-point
     ido-completing-read+
     ido-vertical-mode
     lsp-dart
     lsp-mode
     lsp-ui
     magit
     markdown-mode
     multiple-cursors
     move-text
     nix-mode
     paredit
     projectile
     rainbow-delimiters
     restclient
     rust-mode
     smartparens
     smex
     spacemacs-theme
     sql-indent
     tree-sitter
     tree-sitter-langs
     tide ;; typescript ide
     typescript-mode
     web-mode
     which-key
     yaml-mode
     yasnippet)))

;; Install packages if they are missing
(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

(require 'appearance)

;; Turn on recent file mode so that you can more easily switch to
;; recently edited files when you first start emacs
(setq recentf-save-file (concat user-emacs-directory ".recentf"))
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 40)

;; which-key
(require 'which-key)
(which-key-mode)

(require 'setup-editing)

;; Setup extensions
(require 'setup-sql)
(require 'setup-magit)
(require 'setup-ido)
(require 'setup-paredit)
(require 'setup-html)
(require 'setup-clojure)
(require 'setup-css)
(require 'setup-rust)
(require 'setup-javascript)
(require 'setup-typescript)
(require 'setup-emojis)
(require 'setup-web-mode)
(require 'setup-dart)

;; Setup yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; Functions (load all files in defuns-dir)
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

;; Setup key bindings
(require 'key-bindings)

;; y/n for yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

;; smart M-x
(require 'smex)
(smex-initialize)

;; Show column number in status bar
(setq column-number-mode t)

;; Emacs server
(require 'server)
(unless (server-running-p)
  (server-start))

(add-hook 'after-init-hook #'global-flycheck-mode)
