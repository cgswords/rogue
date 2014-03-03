#lang racket

(module engine racket
  (provide update-state engine-state init)

(require "../entity.rkt")

(define generate-screens (lambda () '()))
(define gui-drawable (lambda () '()))

(define init
  (lambda () 
    (let ((screens (generate-screens)))
      (engine-state '() (gui-drawable) (car screens) screens))))

(struct engine-state (entity-list drawable curscreen screen-graph))

(define update-state
  (lambda (es)
    (let ((el (engine-state-entity-list es))
          (d  (engine-state-drawable es))
          (c  (engine-state-curscreen es))
          (sg (engine-state-screen-graph es)))
     (let ((el (map (lambda (e) ((entity-update entity) el)) el)))
      (engine-state el d c sg))))) 



)

