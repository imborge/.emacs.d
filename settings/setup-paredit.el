;;; setup-paredit.el -- Description
;;; Commentary:
;;; Code:
(require 'paredit)
(require 'smartparens)

;; Change nasty paredit keybindings
;; (defvar my-nasty-paredit-keybindings-remappings
;;   '(("M-s"         "s-s"         paredit-splice-sexp)
;;     ("M-<up>"      "s-<up>"      paredit-splice-sexp-killing-backward)
;;     ("M-<down>"    "s-<down>"    paredit-splice-sexp-killing-forward)
;;     ("C-<right>"   "s-<right>"   paredit-forward-slurp-sexp)
;;     ("C-<left>"    "s-<left>"    paredit-forward-barf-sexp)
;;     ("C-M-<left>"  "s-S-<left>"  paredit-backward-slurp-sexp)
;;     ("C-M-<right>" "s-S-<right>" paredit-backward-barf-sexp)))

(define-key paredit-mode-map (kbd "s-r") 'paredit-raise-sexp)

;; (--each my-nasty-paredit-keybindings-remappings
;;   (let ((original (car it))
;;         (replacement (cadr it))
;;         (command (car (last it))))
;;     (define-key paredit-mode-map (read-kbd-macro original) nil)
;;     (define-key paredit-mode-map (read-kbd-macro replacement) command)))

(defun my-paredit-nonlisp ()
  "Turn on paredit mode for non-lisps."
  (interactive)
  (set (make-local-variable 'paredit-space-for-delimiter-predicates)
       '((lambda (endp delimiter) nil)))
  ;;
  (add-hook 'paredit-mode-hook (lambda ()
                                 (define-key paredit-mode-map (kbd "{") 'paredit-open-curly)
                                 (define-key paredit-mode-map (kbd "}") 'paredit-close-curly)))
  (paredit-mode 1))

(add-hook 'prog-mode-hook 'my-paredit-nonlisp)
(add-hook 'clojure-mode-hook (lambda () (paredit-mode 1)))
(add-hook 'cider-repl-mode-hook (lambda () (paredit-mode 1)))
(add-hook 'emacs-lisp-mode-hook (lambda () (paredit-mode 1)))

(provide 'setup-paredit)

;;; setup-paredit.el ends here
