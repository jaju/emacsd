;;; With advice from
;;; http://www.prism.gatech.edu/~mmoriarity3/random/emacs-setup.html
;;; and help from the emacs-starter-kit

;;; Emacs 24+ only.
;;; Get more stuff to include from:
;;; https://github.com/bbatsov/prelude, and https://github.com/bodil/emacs.d.git

(defvar more-paths
  '("~/bin" "/usr/local/bin"))
(dolist (p more-paths)
  (nconc exec-path p))

(setq custom-file "~/.emacs-custom.el")
(load custom-file 'noerror)

(require 'package)
(require 'hippie-exp)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(starter-kit
    starter-kit-lisp
    ecb
    clojure-project-mode
    paredit
    inf-ruby
    ruby-block
    nrepl
    ac-nrepl
    scala-mode)
  "My default list of required packages at start time.")
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(setq vendors
      '("goodies" "autocomp" "color-theme" "slime" "clojure" "midje-mode"))
(setq list-to-add-to-load-path
      (mapcar (apply-partially 'concat dotfiles-dir "vendor/") vendors))
(nconc load-path list-to-add-to-load-path)

(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories (concat dotfiles-dir "vendor/autocomp/ac-dict"))

(add-to-list 'load-path dotfiles-dir)
(defvar custom-config-files
  '("view"
    "behavior"
    "clojure"
    "toggle-earmuffs"
    "scala"
    "orgmode"))
(dolist (ccf custom-config-files)
  (load (concat "custom/" ccf)))
