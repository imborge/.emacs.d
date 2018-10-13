;;;;
;; Packages
;;;;

;; Define package repositories
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; (add-to-list 'package-archives
             ;; '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(add-to-list 'package-pinned-packages
             '("cider" . "melpa-stable") t)


;; Load and activate emacs packages. Do this first so that the
;; packages are loaded before you start trying to modify them.
;; This also sets the load path.
(package-initialize)

;; Download the ELPA archive description if needed.
;; This informs Emacs about the latest versions of all packages, and
;; makes them available for download.
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(ido-ubiquitous
    smex
    paredit
    projectile
    which-key
    rainbow-delimiters
    tagedit
    magit
    yasnippet
    hydra
    company
    spacemacs-theme
    spaceline
    clojure-mode
    clojure-mode-extra-font-locking
    clj-refactor
    cider
    elpy
    js2-mode
    scss-mode
    go-mode
    haskell-mode
    intero
    markdown-mode
    elm-mode
    yaml-mode
    restclient
    ace-jump-mode
    ;; evil
    psc-ide
    purescript-mode
    dashboard))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(defvar predicate nil)
(defvar inherit-input-method nil)
(defvar ido-cur-item nil)
(defvar ido-default-item nil)
(defvar ido-cur-list nil)

;; Place downloaded elisp files in ~/.emacs.d/vendor. You'll then be able
;; to load them.
;;
;; For example, if you download yaml-mode.el to ~/emacs.d/vendor,
;; then you can add the following code to this file:
;;
;; (require 'yaml-mode)
;; (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'load-path "~/.emacs.d/vendor")

;; Skip splash screen
;; (setq inhibit-splash-screen t      ;; Skip splash screen
;;       initial-scratch-message nil) ;; Empty scratch message

;;;;
;; Customization
;;;;
(add-to-list 'load-path "~/.emacs.d/customizations")
(load "navigation.el")
(load "ui.el")
(load "editing.el")
(load "misc.el")
(load "git.el")
(load "elisp-editing.el")
(load "setup-dashboard.el")
(load "setup-clojure.el")
(load "setup-js.el")
(load "setup-css.el")
(load "setup-org.el")
(load "setup-haskell.el")
(load "setup-purescript.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (scss-mode js2-mode tagedit smex projectile magit))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
