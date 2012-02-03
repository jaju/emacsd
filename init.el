;;; With advice from http://www.prism.gatech.edu/~mmoriarity3/random/emacs-setup.html and help from the
;;; emacs-starter-kit

(setq dotfiles-dir (file-name-directory
		    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)

(setq custom-file "~/.emacs-custom.el")
(load custom-file 'noerror)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq overrides)
(setq subdirs
      '("goodies" "slime" "slime/contrib" "clojure" "cedet"
        "ecb" "rinari" "emacs-eclim" "emacs-eclim/vendor"
        "color-theme" "autocomp" ))
(setq list-to-add-to-load-path (mapcar (apply-partially 'concat dotfiles-dir "vendor/") subdirs))
(nconc load-path list-to-add-to-load-path)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load "custom/view")
(load "custom/behavior")
(load "custom/clojure")
(load "custom/scala")
(load "custom/eclim")
(load "custom/rinari")

(nconc exec-path '("~/bin"))
(nconc exec-path "/usr/local/bin")

(require 'ecb)
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/vendor/autocomp/ac-dict")
