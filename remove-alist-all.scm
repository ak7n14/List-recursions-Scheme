;;;Coursework 1
;;;Question 2
;;;by Anish Katariya(ak7n14@soton.ac.uk)
;;;

;;;Solution:
(define remove-alist-all
  (lambda (pred lst)
    (cond ((null? lst) '())
          ((equal? pred (car (car lst)))(remove-alist-all pred (cdr lst)) )
          (else (cons (car lst) (remove-alist-all pred (cdr lst)))))))
;;;The solution takes an association list and a key as its parameter
;;;It recursively checks each association with the key and removes
;;;all the occurences of the associations containing the key by
;;;by creating a new list without their occurences