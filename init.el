;;; With advice from
;;; http://www.prism.gatech.edu/~mmoriarity3/random/emacs-setup.html
;;; and help from the emacs-starter-kit

;;; Emacs 24+ only.
;;; Get more stuff to include from:
;;; https://github.com/bbatsov/prelude, and https://github.com/bodil/emacs.d.git

;; Setup paths up front so that we can use stuff installed on the system

(defvar more-paths
  '("~/bin" "/usr/local/bin"))
(dolist (p more-paths)
  (nconc exec-path p))

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)

;; Custom settings via the M-x customize* command
(setq custom-file "~/.emacs-custom.el")
(load custom-file 'noerror)

;; Load the custom packages file, and the vendors
(load (concat dotfiles-dir "packages.el") 'noerror)
(load (concat dotfiles-dir "vendor/vendors.el") 'noerror)

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
    "orgmode"
    "keybindings"))
(dolist (ccf custom-config-files)
  (load (concat "custom/" ccf)))
