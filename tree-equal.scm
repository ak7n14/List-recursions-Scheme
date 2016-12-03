;;;Coursework 2
;;;Question 1
;;;by Anish Katariya(ak7n14@soton.ac.uk)
;;;

;;;Solution:

(load "tree-implementation-list.scm")

(define tree-equal?
  (lambda(t1 t2)
    (cond ((and (null? t1) (null? t2)) #t)
          ((and (node? t1) (node? t2))
           (if (set-equal? (tree-labels t1) (tree-labels t2))
               (and (tree-equal? (node-left t1) (node-left t2)) (tree-equal? (node-right t1) (node-right t2)))))
          ((and (leaf? t1) (leaf? t2))
           (if (set-equal? (tree-labels t1) (tree-labels t2)) #t #f))
          (else #f))))

           
;;;The solution takes two binary tree as its parameters
;;;It recursively checks each node/leaves of the tree tree 1
;;;And compares it with the node/leaves on the same level for tree 2
;;;and returns true if the elements in the trees are the same
;;;It compares the lables of each element of the tree using the set-equal? function
;;;Which has already been defined
         