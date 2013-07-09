(setq load-path (cons "/usr/local/share/emacs/site-lisp" load-path))
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
(define-key global-map "\C-cr" 'remember)

(define-skeleton org-presentation-skeleton
  "Inserts org directives for org buffers supposed to generate a slide-show presentation. See https://github.com/jblomo/org-html-slideshow"
  "Base directory: "
  "#+TAGS: slide(s) example(e) video(v) discuss(d) improve(i) fixme(f) quiz(q) exercise(x)\n"
  "#+STYLE: <link rel=\"stylesheet\" type=\"text/css\" href=\"" str "/common.css\" />\n"
  "#+STYLE: <link rel=\"stylesheet\" type=\"text/css\" href=\"" str "/screen.css\" media=\"screen\" />\n"
  "#+STYLE: <link rel=\"stylesheet\" type=\"text/css\" href=\"" str "/projection.css\" media=\"projection\" />\n"
  "#+STYLE: <link rel=\"stylesheet\" type=\"text/css\" href=\"" str "/presenter.css\" media=\"presenter\" />\n\n"
  "#+BEGIN_HTML\n"
  "<script type=\"text/javascript\" src=\"" str "/org-html-slideshow.js\"></script>\n"
  "#+END_HTML\n\n"
  "# Local Variables:\n"
  "# org-export-html-style-include-default: nil\n"
  "# org-export-html-style-include-scripts: nil\n"
  "# End:")
