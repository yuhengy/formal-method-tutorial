

## Introduction

I am going to introduce a few formal verification techniques to analyze the hardware security.
I will use a toy example, a simple state machine and a simple property to verify throughout this tutorial.
The first method to verify this property I will use is symbolic execution, with a framework called Rosette.
And the second method is theorem proving, with a framework called coq.




## Background: Formal Verification

Before going into these concrete examples and code, I want to firstly give an overview about formal verification in general.
From the beginning, the situation is that you will have a design to test, maybe software maybe hardware.
You will probably just run it with a few set of inputs.
For example, you have a sorting algorithm and you just test it with a few lists of numbers.
This is already a verification.

Then what is formal verification?
One simple explanation is just saying that we want to test the design with all possible inputs so that after such verification, we can be very confident that it will always give right result.
Using the sorting algorithm example, it is that we test all possible lists of numbers.

The goal is simple but it is hard to achieve this.
It is just we have too many possible inputs to test and the space is too large.
For a sorting algorithm, the input the list can be infinite long and each element in the list can be any number.
So, to solve this, we have many techniques.
And symbolic execution and theorem proving is two techniques I will demostrate today.

So, for now, I hope we are clear that firstly, the goal of formal verification is just to cover the whole space.
And secondly, different techniques are trying to avoid space explosion.




## Background: Formal Verification in Our Research

Another thing before going into our toy example is some exciting usage of formal verification in our research.
For me, I mainly use it to verify some security properties in a CPU design.
Specifically, it is a simple out-of-order CPU, and we want to verify there's no spectre attacks on it.
I guess you are all familiar with spectre attacks, and maybe know some of the defenses against it.
And most recent defenses are very complex and without a formal verification, it is hard to know whether the defense work or not.

I am also in another project trying to verify, a special set of security properties of CPU or any hardware modules, that are very close to the timing behaviour.
The outcome of that project is still not super clear but we definitely have already found people's current understanding of the timing behaviour is not very good and the techniques used to verify these timing-related security properties are also broken.
Specifically, we found a paper, on top conferences, which proposes a new formal verification technique to tell us whether a hardware module is secure or not.
We can find some example hardware modules, feed them into their framework, and they just give wrong results.
Actually, this maybe a project at a proper stage that an undergraduate student can get involved for a few months, to play with the frameworks and examples.
We can talk more about this if you get interested.

Beyond these two projects on my side, our neighbour research group, Adam's group are using formal methods to verify more stuff, in addition to security property.
I think Thomas is working a verifying the functionality of CPUs?
And I also know stella there is verifying the some memory isolation schemes, like enclaves etc.

OK, so there're many interesting research can be done with these formal verification tools.
But I also like an attitude that all these problems are just execuses so that we can use these fancy tools, write some fancy code.
I actually heard it from Thomas.





## Overview of Naive Approach, Symbolic Execution, and Theorem Proving

Now, let me firstly give some high-level idea about how our two techniques, symbolic execution and theorem proving can help solve the space explosion problem.
Recall our sorting algorithm example.
Let's say we only want to sort a list of 3 numbers, like sort `1 3 2` into `1 2 3`.
And still we have infinite possible inputs and a naive approach that enumerate all cases would not work.

The first technique, symbolic execution is trying to utilize an insight that, actually for these infinite cases, many cases are very similar.
For example, let's see these three inputs:
```
1 3 2 -> 1 2 3
1 4 2 -> 1 2 4
1 5 2 -> 1 2 5
```
They all share a property that the middle number is the largest.
So, for any `1 X 2`, we only need to consider 4 cases:
```
X < 1
X = 1
X = 2
X > 2
```

...TODO...




## Traffic Light Example

OK, here is our toy example want to verify.
We have a state machine below with 4 states and 2 types of input at each cycle.

<img src="figures/1-traffic-light.pdf" alt="traffic-light" width="300"/>

We want to verify a property:
	- If the state machine starts from Red state and simulates for an arbitrary cycle
	- If there is never Smash input
	- Then, it will never reach Broken state.




## Bounded Model Checking

- Goal: verify a property on a system for x steps
- 3 Steps:
  - modeling a system: `Figures/1-traffic-light.pdf`
  - specification / define the property: If always NotSmash, never reach broken state
  - automatic verify: many tools to do this
    - Symbolic execution: `symbolic-execution-example/traffic-light-bounded`




## Unbounded Model Checking

- Goal: how to extend x steps to infinite steps?

- First try: Think about the state machine runs forever, we want to prove the property at any step. While, any step it also has a state, right? If we can prove the property for **any state**, it will be fantastic.
  - symbolic initial state: `symbolic-execution-example/traffic-light-unbounded`
  - Problem: you just state from broken...
  - Solution: State at a higher level to think about this. Look at our logic at the first try. The high-level problem is that we should not verify **any state**, but **any reachable state**.
    - Constrain the initial state. Also called invariance 
    - NOTE: the example is weird since the property is just a reachability, but you can imagin the perperty can be more complex. However, it is helpful to understand it as **verfify the "complex" property on any reachable state**

- Second try: How to add constrain?
  - Manually, use insight: well, it works, but we want a automatic way.
  - Use induction
    - You probably think induction is not a constrain. But think about it, what it means "property hold for 1 cycle?"
    - `symbolic-execution-example/traffic-light-unbounded`

- Improve performance: Counterexample Guided Abstraction Refinement (CGAR)
  - later...
  - Or read example1 (traffic light) on page 6 in https://web.stanford.edu/class/cs357/cegar.pdf




## coq Proof

  ... TODO ...




## Tools

- Rosette
- coq
- JasperGold




## Hardware Description Language

- RTL
- Gem5 level
- Bluespec
  - https://www.youtube.com/watch?v=IdTSgYv8PUM
  - https://www.youtube.com/watch?v=8ZnNcaPnN50
  - The Essence of Bluespec: https://people.csail.mit.edu/bthom/pldi20.pdf
  - kami -> example 
  - Modular SMT-Based Verification of Rule-Based Hardware Designs
- PDL A High-Level Hardware Design Language for Pipelined Processors

In general, they define **events** in different ways.




## NOTEs

- The code includes a vagrant script (https://www.vagrantup.com), a conveninent tool to manage environment. Like dockerFile, but for virtual machine environment.

