;;;Coursework 1
;;;Question 4
;;;by Anish Katariya(ak7n14@soton.ac.uk)
;;;

;;;Solution:
(define map-values
  (lambda(list function)
    (cond ((null? list) '())
          (else (cons (cons (caar list) (function ( cdr (car list)))) (map-values ( cdr list) function))))))

;;;The solution takes an association list and a lambda expression as parameters
;;;It reccursively goes through the list and construsts a new association list by
;;;keeping the key same and peformaing the lambda function on the cdr of evey association