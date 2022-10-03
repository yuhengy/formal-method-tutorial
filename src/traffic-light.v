
Add Rec LoadPath "/home/vagrant/frap" as Frap.
Require Import Frap.Frap.


Inductive input :=
| Smash
| Notsmash.
Inductive inputs :=
| nil
| cons (inps: inputs) (inp: input).

(* inputs examples
nil
cons nil Smash
cons (cons nil Smash) Smash
*)

(* example of defining natural numbers
Inductive nat :=
   | 0
   | S (n: nat).
*)



Inductive state :=
| Red
| Green
| Yellow
| Broken.


Definition step (st: state) (inp : input) :=
  match st with
  | Red => match inp with
           | Smash => Broken
           | Notsmash => Green
           end
  | Green => Yellow
  | Yellow => Red
  | Broken => Broken
  end.
Fixpoint steps (st: state) (inps : inputs) :=
  match inps with
  | nil => st
  | cons prefix inp => step (steps st prefix) inp
  end.


Theorem test_program:
    steps Red (cons (cons (cons (cons nil Notsmash) Notsmash) Notsmash) Smash) = Broken.
Proof.
  (* simplify. *)
  unfold step.
  unfold steps.
  unfold step at 4.
  unfold step at 3.
  unfold step at 2.
  unfold step.
  equality.
Qed.


Fixpoint hasNoSmash (inps: inputs): Prop :=
  match inps with
  | nil => True
  | cons prefix inp => (hasNoSmash prefix) /\ not (inp = Smash)
  end.


Theorem noSmashThenNoBroken: forall inps,
    hasNoSmash inps ->
    not (steps Red inps = Broken).
Proof.
  induct inps.
  - unfold hasNoSmash. intro.
    unfold steps.
    equality.
  - intro.
    
    simpl. (* We tell coq "execute n+1 step actually" means "based on n step's state, execute 1 more step" *)
    
    simpl hasNoSmash in H.
    destruct H. (* We tell coq n+1 steps' input has no smash actually means n steps' input has no smash.  *)
    apply IHinps in H.

    unfold step.
    cases (steps Red inps). (* ; (try equality). *)
    + cases inp.
      * contradiction.
      * equality.
    + equality.
    + equality.
    + contradiction.
Qed.


