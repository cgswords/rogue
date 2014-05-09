#lang racket

(require "gui/gui.rkt")
(require "gui/draw.rkt")
(require "engine/engine.rkt")
(require "lib/datatypes.rkt")


(gui)

(define base-entity (entity (posn 25 25) 0 (void) (void) #f))

(init)

(add-entity base-entity)

(let loop ()
  (draw-entities)
  (loop))

;; (struct posn (x y) #:transparent)
;; (struct entity (posn img update solid) #:transparent)



