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
(setq subdirs '("goodies" "slime" "slime/contrib" "clojure" "cedet" "ecb"))
(setq list-to-add-to-load-path (mapcar (apply-partially 'concat dotfiles-dir "vendor/") subdirs))
(nconc load-path list-to-add-to-load-path)
(nconc exec-path '("~/bin"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'ecb)
(load "custom/view")
(load "custom/behavior")
(load "custom/clojure")
