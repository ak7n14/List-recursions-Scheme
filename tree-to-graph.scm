(load "tree-implementation-list.scm")

(define make-vertex
  (lambda(id tree)
    (list 'vertex (create-label id) (tree-labels tree))))
(define make-edge
  (lambda(id1 id2)
    (list 'edge (create-label id1)(create-label id2))))

(define create-label
  (lambda (l)
    (string->symbol (symbol-append-reverse l))))
(define symbol-append-reverse
  (lambda (los)
    (if (null? los)
        ""
        (string-append (symbol-append-reverse (cdr los))
                       (symbol->string (car los))))))
;;;Coursework 2
;;;Question 4
;;;by Anish Katariya(ak7n14@soton.ac.uk)
;;;

;;;Solution:
(define tree-to-graph
  (lambda(tree)
    (cond ((null? tree) '())
          (else(tree-to-graph-list tree (cons 't'()))))))


(define tree-to-graph-list
  (lambda(tree id)
    (cond((leaf? tree)(cons(make-vertex id tree) '()))
         ((node? tree)
          (cond ((not(and(leaf? (node-left tree))(leaf? (node-right tree))))
                (append(list (make-vertex id tree)
                             (make-edge id (cons 'l id))
                             (make-edge id (cons 'r id)))
                       (tree-to-graph-list (node-left tree)(cons 'l id))
                       (tree-to-graph-list (node-right tree)(cons 'r id))))
                (else (append(list (make-vertex id tree)
                             (make-edge id (cons 'l id))
                             (make-edge id (cons 'r id)))
                       (tree-to-graph-list (node-left tree)(cons 'l id))
                       (tree-to-graph-list (node-right tree)(cons 'r id)))))))))
                
  
;;;The function takes in a tree and passes it to a sub function tree-to-graph-list
;;;The tree-to-graph-list then makes a vertex, if the current element is a leaf then returns the vertex
;;;If current element is a node then the tree creates an edge and a vertex and reccursively calls the its self to
;;;Generate verteces for other elements in the tree.
  