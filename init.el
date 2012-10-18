;;; With advice from
;;; http://www.prism.gatech.edu/~mmoriarity3/random/emacs-setup.html
;;; and help from the emacs-starter-kit

;;; Emacs 24+ only.
;;; Get more stuff to include from:
;;; https://github.com/bbatsov/prelude, and https://github.com/bodil/emacs.d.git

(nconc exec-path '("~/bin"))
(nconc exec-path '("/usr/local/bin"))

(setq custom-file "~/.emacs-custom.el")
(load custom-file 'noerror)

(require 'package)
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
    slime-repl
    inf-ruby
    ruby-block
    ;;slime
    ;;clojure-mode
    nrepl
    rvm)
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
(load "custom/view")
(load "custom/behavior")
(load "custom/toggle-earmuffs")
(load "custom/scala")


;;; Make some space for org-mode!
(load "custom/orgmode")
(setq nrepl-popup-stacktraces nil)
(add-to-list 'same-window-buffer-names "*nrepl*")

(require 'midje-mode)
(require 'clojure-jump-to-file)
