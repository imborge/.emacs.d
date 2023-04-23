;;; setup-dart.el -- Dart setup

;;; Commentary:

;;; Code:
(require 'dart-mode)
(require 'flutter)

;(add-hook dart-mode-hook (prog (dart-mode . flutter-test-mode)))

(eval-after-load 'dart-mode
  '(define-key dart-mode-map (kbd "C-M-x") #'flutter-run-or-hot-reload))

(provide 'setup-dart)
;;; setup-dart.el ends here

