;;; With advice from http://www.prism.gatech.edu/~mmoriarity3/random/emacs-setup.html and help from the
;;; emacs-starter-kit

(setq dotfiles-dir (file-name-directory
		    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)

(color-theme-initialize)
(setq custom-file "~/.emacs-custom.el")
(load custom-file 'noerror)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq overrides)
(setq subdirs '("goodies" "slime" "slime/contrib" "clojure" "cedet" "ecb" "rinari" "emacs-eclim" "emacs-eclim/vendor"))
(setq list-to-add-to-load-path (mapcar (apply-partially 'concat dotfiles-dir "vendor/") subdirs))
(nconc load-path list-to-add-to-load-path)
(nconc exec-path '("~/bin"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'ecb)
(load "custom/view")
(load "custom/behavior")
(load "custom/clojure")
(load "custom/scala")
(load "custom/eclim")

(set-cursor-color "red")
(setq transient-mark-mode t)
(fset 'yes-or-no-p 'y-or-n-p)
(setq default-abbrev-mode 1)

(push "/usr/local/bin" exec-path)

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)

(show-paren-mode t)
(tool-bar-mode -1)
(column-number-mode t)

(set-frame-font "Menlo-14")
(load-theme 'tango)
