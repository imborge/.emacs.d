;;; setup-sql.el -- Description
;;; Commentary:
;;; Code:
(require 'sql)

(add-hook 'sql-mode-hook (lambda ()
                           (sql-set-product 'postgres)
                           (sqlind-minor-mode)))

(provide 'setup-sql)

;;; setup-sql.el ends here
