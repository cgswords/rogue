#lang racket

(provide entity entity? entity-posn entity-img entity-update entity-solid 
         entity<=
         posn posn? posn-x posn-y)

(struct posn (x y) #:transparent)
(struct entity (posn time img update solid) #:transparent)

(struct character (entity))

(define (entity<= e1 e2)
  (<= (entity-time e1) (entity-time e2)))

