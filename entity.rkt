#lang racket

(provide entity posn)

(struct posn (x y) #:transparent)
(struct entity (posn img update) #:transparent)





