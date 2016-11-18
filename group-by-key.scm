;;;Coursework 1
;;;Question 3
;;;by Anish Katariya(ak7n14@soton.ac.uk)
;;;

;;;Solution:
(load "assoc-all.scm")
(load "remove-alist-all.scm")

(define group-by-key
  (lambda(list)
    (cond((null? list) '())
         (else (cons(cons (caar list) (assoc-all (caar list) list)) (group-by-key(remove-alist-all (caar list) list)))))))
;;;The solution takes a list as its parameter
;;;It reccusively goes through the list and makes a new association list
;;;Grouping each association by its key.This is achieved using the functions
;;;Assoc-all.scm and remove-alist-all.scm defined earlier.
;;;Assoc-all takes the caar of the list as the key and gets each association for it
;;;reccursively.
;;;Remove-alist.scm is used to avoid duplications in the answer