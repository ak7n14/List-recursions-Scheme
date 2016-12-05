;;;Coursework 2
;;;Question 2
;;;by Anish Katariya(ak7n14@soton.ac.uk)
;;;

;;;Solution:
(load "tree-implementation-list.scm")
(load "tree-equal.scm")
(define tree-map
  (lambda (fun tree)
    (cond((null? tree) '())
         ((node? tree) (make-node (fun (tree-labels tree))
                                  (tree-map fun (node-left tree)) (tree-map fun(node-right tree))))
         ((leaf? tree) (make-leaf (fun (tree-labels tree)))))))


(define remove-labels
  (lambda (labels tree)
   (tree-map (lambda(set)(set-minus set labels))tree)))

;;;For the 1st function the function takes in another function and a tree
;;;It then makes a new tree by traversing the given tree and copying the
;;;The value of the label after applying the function to it
;;;For the 2nd function I take in the set of labels to be removed
;;;And the tree. I then call the tree-map function and passing in the function
;;;as set-minus of the label of the tree and the list of labels