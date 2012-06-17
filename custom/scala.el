;; scala-aah!
(add-to-list 'load-path "~/svn-git/scala-tool-support/src/emacs")
(require 'scala-mode-auto)

;; ensime
(add-to-list 'load-path "~/.j/ensime/elisp")
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
