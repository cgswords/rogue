#lang racket

(provide draw-entity)
(require "../lib/datatypes.rkt")

(define (draw-entity draw-ctxt)
  (lambda (ent)
    (let ((pos (entity-posn ent))) 
      (send draw-ctxt set-pen "blue" 1 'solid)
      (send draw-ctxt draw-rectangle (posn-x pos) (posn-y pos) 25 25))))
