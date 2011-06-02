(require 'slime)
(require 'clojure-mode)

(eval-after-load "slime"
  '(progn (slime-setup '(slime-repl))))
(setq slime-use-autodoc-mode nil)
(slime-setup)