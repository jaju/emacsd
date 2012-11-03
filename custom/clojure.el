(require 'clojure-mode)

;(add-hook 'slime-repl-mode-hook 'clojure-mode-font-lock-setup)
(setq auto-mode-alist (cons '("\\.cljs" . clojure-mode) auto-mode-alist))
;(clojure-enable-slime-on-existing-buffers)

(require 'midje-mode)
(require 'clojure-jump-to-file)

(setq nrepl-popup-stacktraces nil)
(add-to-list 'same-window-buffer-names "*nrepl*")

(require 'ac-nrepl)
(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'nrepl-mode))
