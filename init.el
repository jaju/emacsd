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
(load "packages.el" 'noerror)
(load "vendor/vendors.el" 'noerror)

(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories (concat dotfiles-dir "vendor/autocomp/ac-dict"))

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

(setq abbrev-file-name
      (concat dotfiles-dir "custom/abbrevs.el"))
(setq save-abbrevs t)
(if (file-exists-p abbrev-file-name)
    (quietly-read-abbrev-file))
(add-hook 'org-mode-hook (lambda () (abbrev-mode 1)))
(add-hook 'text-mode-hook (lambda () (abbrev-mode 1)))

(load (concat dotfiles-dir "ox-reveal.el"))
(require 'ox-reveal)

(custom-set-variables
 '(speedbar-show-unknown-files t)
)
