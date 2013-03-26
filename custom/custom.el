(defvar custom-configs
  '("view"
    "behavior"
    "clojure"
    "toggle-earmuffs"
    "scala"
    "orgmode"))

(setq cur-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

(setq file-names
      (mapcar
       (defun append-el (name) (concat name ".el"))
       custom-configs))

(setq list-to-add-to-load-path
      (mapcar (apply-partially 'concat cur-dir) file-names))

(nconc load-path list-to-add-to-load-path)
