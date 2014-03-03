#lang racket
(require math/array)
(provide (all-defined-out))

(define new-screen
  (lambda () (build-array #(17 12) (lambda args 0))))

(struct screen (links [tiles #:mutable #:auto])
        #:transparent
        #:auto-value (new-screen))
