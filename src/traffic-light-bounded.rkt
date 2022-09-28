#lang rosette

(require "traffic-light.rkt")

(define param-simu-step 10)

(define (traffic-light-bounded)

  ; use the initial state
  (define state param-state-red)

  ; check the property for 10 cycle
  (for ([i (in-range param-simu-step)])

    ; use a symbolic input
    (define-symbolic* input boolean?)
    (assume (input-not-smash input))

    ; update state
    (set! state (traffic-light-step state input))
    ;(error-print-width 1000)
    ;(printf (~a "state: " (~v state) "\n"))

    ; property to check
    (assert (state-not-broken state))
    ;(println (vc))
  )

)


(define (main)
  (println (verify (traffic-light-bounded)))
)
(main)

