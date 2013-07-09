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

(define-skeleton skeleton-clojure-project
  "Create a skeleton clojure project.clj"
  "Name of project: "
  "(defproject " str " \"0.1.0-SNAPSHOT\""
  \n >
  ":description \"\""
  \n >
  ":jar-name \"" str ".jar\""
  \n >
  ":uberjar-name \"" str "-standalone.jar\""
  \n \n >
  ":min-lein-version \"2.2.0\""
  \n \n >
  ":source-paths [\"src/clojure\"]"
  \n >
  ":java-source-paths [\"src/java\"]"
  \n >
  ":test-paths [\"test/clojure\"]"
  \n >
  ":resource-paths [\"src/resources\"]"
  \n \n >
  ":dependencies [[org.clojure/clojure \"1.5.1\"]]"
  \n \n >
  ":profiles {"
  \n >
  "           :dev {"
  \n >
  "                 :dependencies [[midje \"1.5-alpha5\" :exclusions [org.clojure/clojure]]]"
  \n >
  "                 }}"
  \n \n >
  ":repl-options {\n"
  \n >
  "               :prompt (fn [ns] (str \"[" str " -> \" ns \"]> \"))"
  \n >
  "               :init-ns " str ".main"
  \n >
  "               :port 60001" \n >
  "               }" \n \n >
  ":warn-on-reflection true" \n >
  ":javac-options [\"-target\" \"1.6\" \"-source\" \"1.6\"]" \n >
  ":compile-path \"target/classes\"" \n >
  ")" \n >)
