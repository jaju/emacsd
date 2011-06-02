(ido-mode t)
(ido-everywhere nil)
(setq ido-enable-last-directory-history t)
(setq ido-show-dot-for-dired t)

(defun google-region (beg end)
  "Google the selected region."
  (interactive "r")
  (browse-url (concat "http://www.google.com/search?ie=utf-8&oe=utf-8&q=" (buffer-substring beg end))))
(global-set-key (kbd "C-c C-q") 'google-region)