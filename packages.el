(require 'package)
(require 'hippie-exp)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(
    starter-kit
    starter-kit-lisp
    paredit
    auto-complete
    clojure-mode
    nrepl
    ac-nrepl
    zenburn-theme
    )
  "My default list of required packages at start time.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
