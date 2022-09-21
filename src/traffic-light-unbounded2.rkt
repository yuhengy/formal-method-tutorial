#lang rosette

(require "traffic-light.rkt")

(define (traffic-light-unbounded2)

  ; use a symbolic initial state
  (define-symbolic* state integer?)
  (assume (or (equal? state param-state-red)
              (equal? state param-state-green)
              (equal? state param-state-yellow)
              (equal? state param-state-broken)))


  ; Induction Hypothesis: If it is secure at n-cycle, ...
  (define-symbolic* input-n boolean?)
  (assume (input-not-smash input-n))
  (set! state (traffic-light-step state input-n))
  (assume (state-not-broken state))


  ; Induction assertion: ..., then it is also secure at (n+1)-cycle
  (define-symbolic* input-n1 boolean?)
  (assume (input-not-smash input-n1))
  (set! state (traffic-light-step state input-n1))
  (assert (state-not-broken state))

)


(define (main)
  (println (verify (traffic-light-unbounded2)))
)
(main)

