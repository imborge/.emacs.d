;;; init --- Emacs initialization file
;;; Commentary:

;; This file bootstraps the Emacs configuration

;;; Code:

(require 'package)

;; Add melpa to package repos
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)

;; Load and activate emacs packages.
(package-initialize)

(setq custom-file "~/.emacs.d/custom.el")

;; Download the ELPA archive description if needed.
(when (not package-archive-contents)
  (package-refresh-contents))

;; Install `use-package` if not installed
(when (not (package-installed-p 'use-package))
  (package-install 'use-package))

(add-to-list 'load-path "~/.emacs.d/better-defaults")
(require 'better-defaults)

(add-to-list 'default-frame-alist '(font . "Iosevka"))
(set-face-attribute 'default t :font "Iosevka")

;; Disable blinking cursor
(blink-cursor-mode 0)

;; Backups
(setq backup-directory-alist `(("." . "~/.emacs_backup")))
(setq backup-by-copying t)

;; Packages setup
(use-package smex
  :ensure t
  :bind ("M-x" . smex))

(use-package rainbow-delimiters
  :ensure t
  :init
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))

(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

(use-package paredit
  :ensure t
  :diminish paredit-mode
  :bind ("C-k" . paredit-kill)
  :init
  (add-hook 'clojure-mode-hook 'enable-paredit-mode)
  (add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode))

(use-package evil
  :ensure t
  :config
  (evil-mode))

(use-package which-key
  :ensure t
  :config
  (which-key-mode +1))

(use-package spacemacs-theme
  :ensure t
  :defer t
  :init (load-theme 'spacemacs-dark t))

(use-package winum
  :ensure t
  :config
  (winum-mode 1))

(use-package flycheck
  :ensure t
  :init
  (add-hook 'after-init-hook #'global-flycheck-mode)
  (setq flycheck-emacs-lisp-load-path 'inherit)
  (setq flycheck-check-syntax-automatically '(save mode-enabled)))

(use-package haskell-mode
  :ensure t)

(use-package company
  :ensure t
  :defer t
  :init (global-company-mode))

(use-package dante
  :ensure t
  :after haskell-mode
  :commands 'dante-mode
  :init
  (setq dante-repl-command-line '("nix-shell" "--attr" "env" "release.nix" "--run" "cabal repl"))
  (add-hook 'haskell-mode-hook 'flycheck-mode)
  (add-hook 'haskell-mode-hook 'dante-mode))

(use-package nix-mode
  :ensure t)

(use-package spaceline
  :ensure t
  :pin melpa-stable
  :init
  (require 'spaceline-config)
  :config
  (spaceline-spacemacs-theme))

(use-package diff-hl
  :ensure t
  :config
  (global-diff-hl-mode)
  (unless (display-graphic-p)
    (setq diff-hl-side 'left)
    (diff-hl-margin-mode)))

(provide 'init)
;;; init.el ends here
