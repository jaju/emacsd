(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-agenda-files
      '("~/.org/agenda" "~/.org/notes"))
(setq org-log-done t) ;; This sets timestamps on tasks when finished.
(setq org-startup-indented t)
(setq org-src-fontify-natively t)
(setq org-todo-keywords
      '((sequence "TODO" "FEEDBACK" "VERIFY" "|" "DONE" "DELEGATED")))
(setq org-default-notes-file "~/.org/on-the-fly-notes.org")
(define-key global-map "\C-cc" 'org-capture)
