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

## Day 2 Progress
By the end of my pairing session on the second day, my partner and I reached the end of step 11 where we used a double to mock the behaviour of station to track the value of `entry_station` and test successfully. We both contributed to a repo on my partner's Github, more detailed commits here: https://github.com/ahmad047/oystercard

I updated my code in this repo with the progress we made today. 

## Day 3 Progress
Went through steps 8 - 11 again to really nail down the concepts of stubbing and creating doubles to test classes in isolation. More detailed commits in my partner's repo: https://github.com/Mintar89/oystercard

## Day 4 Progress
Reached step 14 where we created a Station class and began breaking the Oystercard class into another Jounrney class to eventually keep track of penalty fares and zone charges. This was a very tricky step and remains incomplete. 
