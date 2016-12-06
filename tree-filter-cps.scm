;;;Coursework 2 
;;;Question 5
;;;by Anish Katariya

;;;Solution:
(load "tree-implementation-list.scm")
(load "tree-equal.scm")
(define tree-filter-cps
  (let ((list-or-empty
         (lambda (list a b)
           (cond ((and a b) list)
                 ((or a b) '())
                 (else list)))))

    (lambda (pred t c)
      (let ((labels (tree-labels t)))
        (if (leaf? t)

            (pred labels
              (lambda (pred-result-cps)
                (c (make-leaf (list-or-empty labels pred-result-cps #t))
                      (make-leaf (list-or-empty labels pred-result-cps #f)))))

            (pred labels
              (lambda (pred-result-cps)
                (tree-filter-cps
                  pred
                  (node-left t)
                  (lambda (yes-l no-l)
                    (tree-filter-cps
                      pred
                      (node-right t)
                      (lambda (yes-r no-r)
                        (c (make-node (list-or-empty labels pred-result-cps #t) yes-l yes-r)
                              (make-node (list-or-empty labels pred-result-cps #f) no-l no-r)
                              ))))))))))))

(define member-a
  (lambda (l cont)
    (cond ((null? l) (cont #f))
          ((member (car l) '(a aa aaa aaaa aaaaa)) (cont #t))
          (else (member-a (cdr l) cont)))))

;;;The function takes in A predicate,tree and continuation. It uses continuation passing style to create two results
;;;It returns a tree containing all the elements in that satisfy the predicate and a tree of all elements not
;;;a tree not satisfying the predicate.
;;;I first use a let function to determine if the tree is empty or not if it is return and empty list
;;;I check wether the current element in the tree is a leaf if so check the predicate against the label if so add
;;;it to the 1st tree if not add it to the second one
;;;If its a node do the same process reccursively on the node and following nodes