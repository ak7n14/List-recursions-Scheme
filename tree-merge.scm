;;;Coursework 2
;;;Question 3
;;;by Anish Katariya(ak7n14@soton.ac.uk)
;;;

;;;Solution:
(load "tree-implementation-list.scm")
(define tree-merge
  (lambda (t1 t2)
   (cond((and (null? t1) (null? t2)) '())
        ((and (node? t1) (node? t2)) (make-node (set-union (tree-labels t1) (tree-labels t2))
                                                (tree-merge (node-left t1) (node-left t2))
                                                (tree-merge (node-right t1) (node-right t2))))
        ((and (leaf? t1) (leaf? t2)) (make-leaf(set-union (tree-labels t1) (tree-labels t2))))
        ((leaf? t1) (make-node (set-union (tree-labels t1) (tree-labels t2))
                              (node-left t2) (node-right t2)))
        ((leaf? t2) (make-node (set-union (tree-labels t1) (tree-labels t2))
                              (node-left t1) (node-right t1))))))

;;;The function takes in 2 trees. It reccursively traverses the whole tree
;;;It checks if the current elements in both the trees are nodes or leaves
;;;It then creates a new node or a leaf according to the situation and making the
;;;Label for the tree using the pre defined set-union function.