#lang racket
(require racket/gui/base)

(provide draw-hex-grid)

(define scale 30)
(define a (* 1 scale))
(define b (* 1.732 scale))
(define c (* 2 scale))

(define hex-outline
  `(( 0        . ,(+ a c)) 
    ( 0        . ,a) 
    (,b        . 0) 
    (,(* 2 b)  . ,a) 
    (,(* 2 b)  . ,(+ a c)) 
    (,b        . ,(* 2 c))))

(define draw-sprites
  (lambda (dc) (void)))

(define draw-hex-grid
  (lambda (dc)
    (for ([i (in-range 0 9 1)])
      (for ([j (in-range 0 14 1)])
        (if (even? j)
          (send dc draw-polygon hex-outline  (+ 30 (* i 100)) (+ 30 (* j 90)))
          (send dc draw-polygon hex-outline  (+ 82 (* i 100)) (+ 30 (* j 90))))))))

(define frame (new frame%
                   [label "Gamer Game"]
                   [width 660]
                   [height 860]))

(new canvas% [parent frame]
             [paint-callback
              (lambda (canvas dc)
                (draw-sprites dc)
                (send dc set-text-foreground "blue")
                (send dc draw-text "Don't Panic!" 0 0)
                (draw-hex-grid dc))])

(send frame show #t)
