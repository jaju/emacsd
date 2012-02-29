(setq transient-mark-mode t)
(fset 'yes-or-no-p 'y-or-n-p)
(setq default-abbrev-mode 1)

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)

(ido-mode t)
(ido-everywhere nil)
(setq ido-enable-last-directory-history t)
(setq ido-show-dot-for-dired t)

(defun google-region (beg end)
  "Google the selected region."
  (interactive "r")
  (browse-url (concat "http://www.google.com/search?ie=utf-8&oe=utf-8&q=" (buffer-substring beg end))))
(global-set-key (kbd "C-c C-q") 'google-region)

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
