(provide 'setup-org)

(setq org-roam-v2-ack t)
(setq org-roam-directory (file-truename "~/org-roam"))

(org-roam-db-autosync-mode)

(setq org-roam-capture-templates
      '(("d" "default" plain "%?"
        :target (file+head "%<%Y-%m-%d%H%M%S>-${slug}.org"
                           "#+title: ${title}\n")
        :unnarrowed t)

        ("a" "audience" plain (file "~/org-roam/templates/Audience.org")
         :target (file+head "%<%Y-%m-%d%H%M%S>-${slug}.org"
                            "#+title: ${title}\n")
         :unnarrowed t)))


(global-set-key (kbd "C-c n f") 'org-roam-node-find)
