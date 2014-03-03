#lang racket

(provide entity entity? entity-posn entity-img entity-update entity-solid 
         posn posn? posn-x posn-y)

(struct posn (x y) #:transparent)
(struct entity (posn img update solid) #:transparent)





