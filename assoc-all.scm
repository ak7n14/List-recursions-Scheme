;;;Coursework 1
;;;Question 1
;;;by Anish Katariya(ak7n14@soton.ac.uk)
;;;

;;;Solution:
(define assoc-all
  (lambda (pred lst)
    (cond ((null? lst) '())
          ((equal? pred (car (car lst))) (cons (cdr (car lst)) (assoc-all pred (cdr lst))))
          (else (assoc-all pred (cdr lst))))))
;;;The solution takes an association list and a key as its parameter.
;;;It reccursively checks the key against each association in the list
;;;and creates as new association list having only those occurences in the
;;;list which contain the key