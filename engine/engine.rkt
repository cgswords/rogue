#lang racket

(provide update-state engine-state init game-state 
         add-entity draw-entities)

(require "../lib/datatypes.rkt")
(require "../gui/gui.rkt")
(require "../gui/draw.rkt")
(require data/heap)
(require racket/vector)

(struct engine-state (entity-list curscreen screen-graph))

(define game-state (void))

(define generate-screens (lambda () '()))

(define init
  (lambda () 
    (let ((screens (generate-screens)))
      (set! game-state (engine-state (make-heap entity<=) (void) screens)))))

(define update-state
  (lambda (es)
    (let ((el (engine-state-entity-list es))
          (c  (engine-state-curscreen es))
          (sg (engine-state-screen-graph es)))
     (let ((el (map (lambda (e) ((entity-update entity) es)) el)))
      (engine-state el c sg))))) 

(define (draw-entities)
  (let ((entities (heap->vector (engine-state-entity-list game-state))))
    (vector-map (draw-entity (get-screen-buffer)) entities)))

(define (add-entity entity)
  (heap-add! (engine-state-entity-list game-state) entity))

