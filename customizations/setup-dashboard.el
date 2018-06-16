(require 'dashboard)

;; Exlude ido.last
(add-to-list 'recentf-exclude "ido\.last")

(dashboard-setup-startup-hook)
(setq dashboard-banner-logo-title "borgemacs")
(setq dashboard-startup-banner 'logo)
