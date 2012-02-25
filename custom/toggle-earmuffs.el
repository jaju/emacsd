;;; From - https://gist.github.com/1385279 via http://inclojurewetrust.blogspot.in/2011/11/earmuffs-and-variables.html
(defun toggle-earmuffs ()
  "Add or remove earmuffs (asterisks at front and end) of
variables."
  (interactive)

  (let* ((saved-point (point))
         (variable (thing-at-point 'symbol))
         (bounds (bounds-of-thing-at-point 'symbol))
         (len (- (cdr bounds) (car bounds)))
         (start-char (elt variable 0))
         (end-char (elt variable (1- len))))
    (save-excursion
      (cond
       ;; remove earmuffs
       ((and (= ?* start-char) (= ?* end-char) (> len 1))

        (kill-region (car bounds) (cdr bounds))
        (insert (substring variable 1 (1- len)))
        (setq saved-point (1- saved-point)))

       ;; add earmuffs
       ((and (/= ?* start-char) (/= ?* end-char))

        (kill-region (car bounds) (cdr bounds))
        (insert (concat "*" variable "*"))
        (setq saved-point (1+ saved-point)))

       ((and (= ?* start-char) (= ?* end-char) (= len 1))
        (message "Don't know what to do with a single asterisk"))

       (t (message "The symbol has asterisk at the one end only"))))

    (goto-char saved-point)))
