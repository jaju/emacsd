;; scala-aah!
;(add-to-list 'load-path "~/svn-git/scala-tool-support/src/emacs")

;; ensime
(add-to-list 'load-path "~/.j/ensime/elisp")
(require 'scala-mode-auto)
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
