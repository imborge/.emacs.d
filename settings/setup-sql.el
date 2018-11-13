(require 'sql)

(add-hook 'sql-mode-hook (lambda () (sql-set-product 'postgres)))

(provide 'setup-sql)
