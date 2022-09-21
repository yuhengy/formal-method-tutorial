
## Bluespec by arvind

- https://www.youtube.com/watch?v=IdTSgYv8PUM
- https://www.youtube.com/watch?v=8ZnNcaPnN50
- Summary: one-rule-at-a-time, the compiler can dicide the order of rules and according to the order, maxmial the concurrency.

- The conflict matrix of a module is an important concept, because
  + When this modules is used with other, conflict matrix decide how much concurrency can have. Protentially indicate the performance
  + By changing the implementation of the module, it can make conflic matrix better, may improve performance
  + Then, the question is
    * How good is conflict matrix indicate performance
    * how easy to change implementation to improve conflict matric
  + from these questions, I feel no good anwser, so, I think Bluespec is only good at abstraction but bad at performance


## The Essence of Bluespec

- Author&Conf: Thomas PLDI2020
- Summary: extend bluespec with a description of the order of rules. With it, the scheduler is determined and performance is determined.


## Kami: A Platform for High-Level Parametric Hardware Specification and Its Modular Verification

- Author&Conf: adam & arvind 2017
- Summary: use coq verify about bluespec


## Mechanized Proofs that Hardware is Safe from Timing Attacks

- link to PrjSpecVeri-post/papers.md


## Modular SMT-Based Verification of Rule-Based Hardware Designs

- Author&Conf: Andrew C. Wright's PhD thesis 2021
- Summary: infinite queue abstract (is the specification of) a 1-entry queue, because infinite queue capture more rule sequences

- This only holds in bluespec but not in verilog
  - in verilog 1-entry queue has more backpressure
  - why we have the differece?
    - abstraction is always meaning more possible event sequences
    - however, verilog use signal as event, bluespec use rule as event, so different
    - Another understanding is that bluespec automatic grenerate backpressure from compiler, so we do not care backpressure in bluespec




## PDL A High-Level Hardware Design Language for Pipelined Processors

- Author&Conf: Edward Suh PLDI2022
- Summary: A language that can compile pipeline regs.





