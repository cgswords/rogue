#lang racket

(require racket/gui/base)
(require racket/draw)
(require "../lib/datatypes.rkt")

(provide gui get-screen-buffer)

(define game-canvas%
  (class canvas%
    (inherit get-width get-height refresh)

    ;; direction : one of #f, 'left, 'right, 'up, 'down
    (define direction #f)
    (define entity-list '())

    (define/override (on-event e)
      (case (send e get-event-type)
        [(left-down)
         (set! direction 
            (string-append* 
              (list "(" (~a (send e get-x))  ", " (~a (send e get-y)) ")")))
         (refresh)]
        [else (void)]))

    (define/override (on-char ke)
      (case (send ke get-key-code)
        [(left right up down)
         (set! direction (send ke get-key-code))
         (refresh)]
        [else (void)]))

    (define/private (my-paint-callback self dc)
      (let ([w (get-width)]
            [h (get-height)])
        (when direction
          (let ([dir-text (format "going ~a" direction)])
            (let-values ([(tw th _ta _td)
                          (send dc get-text-extent dir-text)])
              (send dc draw-bitmap screen 0 0)
              (send dc draw-text dir-text 
                                 (max 0 (/ (- w tw) 2))
                                 (max 0 (/ (- h th) 2)))
              (let ((new-buf screen)
                    (new-buf-dc screen-dc))
                (set! screen buf)
                (set! screen-dc buf-dc)
                (set! buf new-buf)
                (set! buf-dc new-buf-dc)
                (send buf-dc set-background "white") 
                (send buf-dc clear) 
                ))))))

    (define screen (make-bitmap 600 400))
    
    (define screen-dc (new bitmap-dc% [bitmap screen]))

    (define buf (make-bitmap 600 400))

    (define buf-dc (new bitmap-dc% [bitmap buf]))

    (define/public (get-screen-buffer) buf-dc)

    (super-new (paint-callback (lambda (self dc) (my-paint-callback self dc))))))

(define game-frame
  (let ([new-es (make-eventspace)])
    (parameterize ([current-eventspace new-es])
       (new frame% (label "game") (width 600) (height 400)))))

(define game-canvas (new game-canvas% (parent game-frame)))

(define (gui) (send game-frame show #t))

(define (get-screen-buffer) (send game-canvas get-screen-buffer))

