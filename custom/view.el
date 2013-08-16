(require 'color-theme)
(setq color-theme-is-global t)

(if (eq system-type 'darwin)
  (set-frame-font "Menlo-10"))

;;(load "vendor/color-theme/color-theme.el")
;;(color-theme-initialize)
(load-file (concat dotfiles-dir "vendor/sunburst/sunburst.el"))
(sunburst)
(set-cursor-color "red")

(tool-bar-mode 1)
(column-number-mode t)
(setq mac-allow-anti-aliasing t)
(show-paren-mode t)
(column-number-mode t)
(setq search-highlight t)
(setq line-number-mode t)
(global-font-lock-mode t)
(follow-mode t)

(defun fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
		       (if (frame-parameter nil 'fullscreen) nil 'fullboth)))
(global-set-key (kbd "C-M-m") 'fullscreen)
;;(fullscreen)
