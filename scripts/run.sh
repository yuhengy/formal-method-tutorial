
## pwd is always in formal-method-tutorial folder




## docker
# docker pull yuhengy/formal-method-tutorial # update the image
# docker compose up -d
# docker compose exec env bash --login
# docker compose stop
# docker compose down --rmi all
# cd /vagrant




## Racket
# raco test src/traffic-light-bounded.rkt
# raco test src/traffic-light-unbounded1.rkt
# raco test src/traffic-light-unbounded2.rkt

## Documents for Racket and Rosette
# https://docs.racket-lang.org




## shortcuts for coq
# Use vim to open the file
# Ctrl+j : evaluate for next line
# Ctil+k : un-evaluate for current line
# \ c l (type them one-by-one) : evalutate/un-evaluate to current line of cursor

## A cheat sheet for coq command I use
# https://www.cs.cornell.edu/courses/cs3110/2018sp/a5/coq-tactics-cheatsheet.html




## Run verilator and GLIFT
# python3 scripts/run_verilator.py src/MUX_top.v # waveform is generated at build/MUX_top/myVCD.vcd
# python3 scripts/run_yosys.py src/MUX.ys # The augmented src/MUX_t.v is generated. Figure figures/MUX.svg and figures/MUX_t.svg are generated.
# python3 scripts/run_verilator.py src/MUX_t_top.v

