# pascal-mastermind
An implementation of the classic board game mastermind - originally written when I was 15!

Now at 30, with a high school programming class, college Computer Science degree and 8 years of professional software engineering experience, I've dug up this code from my dropbox and am trying to (1) understand it, (2) rebuild it to my current standard, (3) do something crazy - containerize, publish, something.


# Next Steps

0. Basic unit conversion
    - I want to follow test-driven development for this. But to make the code testable, we're going to need to transform it from a program with procedures that write directly to the console, to a unit with functions that the program calls.
    - goal here is to do minimal changes to the code, while making it testable. The use of global variables in abundance means we're likely going to need to rebuild a bunch of things just to get the refactor to work, but that's just what it is.
1. Unit testing
    - we have a basic set of tests on the calcs library, so we have a starting point. once the code has been built into a unit, we'll be able to create tests and refactor much more deeply.