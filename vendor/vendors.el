(defvar vendors
  '("goodies"
    "autocomp"
    "color-theme"
    "clojure"))

(setq cur-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

(setq list-to-add-to-load-path
      (mapcar (apply-partially 'concat cur-dir) vendors))

(nconc load-path list-to-add-to-load-path)
