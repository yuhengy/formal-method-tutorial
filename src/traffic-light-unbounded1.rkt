#lang rosette

(require "traffic-light.rkt")

(define param-simu-step 1)

(define (traffic-light-unbounded1)

  ; use a symbolic initial state
  (define-symbolic* state integer?)
  (assume (or (equal? state param-state-red)
              (equal? state param-state-green)
              (equal? state param-state-yellow)
              (equal? state param-state-broken)))

  ; check the property for 1 cycle
  (for ([ignore (in-range param-simu-step)])

    ; use a symbolic input
    (define-symbolic* input boolean?)
    (assume (input-not-smash input))

    ; update state
    (set! state (traffic-light-step state input))

    ; check the property
    (assert (state-not-broken state))
  )

)


(define (main)
  (println (verify (traffic-light-unbounded1)))
)
(main)

