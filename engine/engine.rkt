#lang racket
(module engine racket
  (provide update-state engine-state init)
 

(define init
  (lambda () 
    (let ((screens (generate-screens)))
      (engine-info '() (gui-drawable) (car screens) screens))))

(struct engine-state (entity-list drawable curscreen screen-graph))

(define update-state
  (lambda (es)
    (let ((el (engine-state-entity-list es))
          (d  (engine-state-drawable es))
          (c  (engine-state-curscreen es))
          (sg (engine-state-screen-graph es)))
     (let ((el (map (lambda (e) ((entity-update entity) entity-list)) el)))
      (engine-state el d c sg))))) 



)

