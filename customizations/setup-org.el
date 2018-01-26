(require 'org)

(setq org-agenda-files
      (file-expand-wildcards "~/orgmode/*.org"))

(global-set-key (kbd "C-c a") 'org-agenda)
