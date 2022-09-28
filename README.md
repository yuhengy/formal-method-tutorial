

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




## Traffic Light Example

OK, here is our toy example want to verify.
We have a state machine below with 4 states and 2 types of input at each cycle.

<img src="figures/1-traffic-light.pdf" alt="traffic-light" width="300"/>

We want to verify a property:
  - If the state machine starts from Red state and simulates for an arbitrary cycle
  - If there is never Smash input
  - Then, it will never reach Broken state.




## Symbolic Exectution (Bounded)




## Symbolic Exectution (Unbounded)




## coq Proof




## NOTEs

- The code includes a vagrant script (https://www.vagrantup.com), a conveninent tool to manage environment. Like dockerFile, but for virtual machine environment.

