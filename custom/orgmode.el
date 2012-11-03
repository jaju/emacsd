(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-agenda-files
      '("~/.org/agenda"))
(setq org-log-done t) ;; This sets timestamps on tasks when finished.
(setq org-startup-indented t)
(setq org-src-fontify-natively t)
