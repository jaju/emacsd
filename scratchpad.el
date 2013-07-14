(set-frame-font "Menlo-10")
(set-frame-font "Menlo-20")
(require 'org)

(setq ispell-program-name "/usr/local/bin/aspell")

(add-hook 'clojure-mode-hook
          (lambda () (flyspell-prog-mode)))
