#lang rosette

(provide (all-defined-out))


; STEP1 Model the system
(define param-state-red    0)
(define param-state-green  1)
(define param-state-yellow 2)
(define param-state-broken 3)

(define param-input-smash    #t)
(define param-input-notsmash #f)


(define (traffic-light-step state input)
  (cond
    [(and (equal? state param-state-red)
          (equal? input param-input-smash))
      param-state-broken]
    
    [(and (equal? state param-state-red)
          (not (equal? input param-input-smash)))
      param-state-green]
    
    [(equal? state param-state-green)
      param-state-yellow]
    
    [(equal? state param-state-yellow)
      param-state-red]
    
    [(equal? state param-state-broken)
      param-state-broken]
  )
)


; STEP2 define the property
(define (input-not-smash input)
  (not (equal? input param-input-smash))
)
(define (state-not-broken state)
  (not (equal? state param-state-broken))
)




(define (example1)
  (println (traffic-light-step param-state-red param-input-notsmash))

  (define-symbolic* input boolean?)
  (println (traffic-light-step param-state-red input))
)

(define (example2)
  (define-symbolic* input boolean?)
  (define state (traffic-light-step param-state-red input))
  (println state)

  (assert (state-not-broken state))
)

(define (example3)
  (define-symbolic* input boolean?)
  (define state (traffic-light-step param-state-red input))
  (println state)

  (assume (input-not-smash input))
  (assert (state-not-broken state))
)

(define (example4)
  (define-symbolic* input boolean?)
  (define state (traffic-light-step param-state-red input))
  (println state)

  (assert (if (input-not-smash input) (state-not-broken state) #t))
)


(define (main)
  (example1)
  (println (verify (example2)))
  (println (verify (example3)))
  (println (verify (example4)))
)
;(main)

