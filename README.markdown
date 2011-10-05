# Life Bowling

The revolutionary life-bowling system, now on the web!  
This is my ruby-on-rails apprenticeship project.

####TODO:
* Feature: instead of the yellow frame incrementing 
each time I finish a frame, the yellow frame is always
the first incomplete frame.
* Lay out frames properly
* REFACTOR: move some Frame helpers/methods to Game

### Next Milestone:
* 10/8/2011: Pleasant-looking, bug-free, user-ready app

#### Past Milestones:
* 10/4/2011: user-friendly UI
* 9/20/2011: functional app

## Questions:
####Design
* Passing locals to partials: is it pretty much a trick to reduce complexity
when the app gets too huge?  Are there differing tastes here?  Should I imitate
our main codebase's style?
* Is the Game Controller the best place 
to call and write the actual scoring algorithm?

####Technical
* how do I embed a link to a controller request?  I made an
ugly route and ugly game-controller action to allow inactive frames to
activate when clicked.
* I hear 'fat model' is good.  How do I validate the values
in relation to each other?  Use validate_each on just one value
and run a block full of side-effects?
* I can't figure out how to fix my test database!

####Learning
* My tables are ugly and HTML attributes are uglier.
What's the most painless way to get a hang of this stuff?

