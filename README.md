# Oystercard Challenge
A system emulating the behaviour of London's Oystercard infrastructure which tests skills in Ruby, TDD and object-oriented design.

## Issue notes
Review of initial error in Challenge 3:
* Type of error: NameError: uninitialized constant Oystercard
* File path where error happened: ./spec/oystercard_spec.rb.
* Line number: 1
* Ruby doc says: "Raised when a given name is invalid or undefined."
* Solve the error by creating the class Oystercard and remember to 'require' the file

## Day 1 Progress
The first day covered the basics of TDD as well as introducing us to creating our own Gemfiles. My partner and I reached the end of Step 7 where we now have an Oystercard that has a default balance of £0 and a max limit of £90 which is initialised as a constant. You are able to top up and deduct from the card and it throws an error if you attempt to exceed the limit of £90 when you top up. 



