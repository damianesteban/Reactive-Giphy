# Reactive Giphy

This repository contains the source code for the iOS *Reactive Giphy* - a [coding exercise](http://timehop.interviews.s3.amazonaws.com/exercises/gif_searcher/index.html) for Timehop.

## Getting Started

**To install the dependencies:**

```
$ bundle install
```

I usually include a Gemfile in my iOS projects for two reasons.  1.)  I use Fastlane for CI/CD and 2.) Many issues surrounding merge conflicts occur when one developer is using a different version of cocoapods from another.  On that note:

**To install cocoapods:**

```
$ bundle exec pod install
```

## Approach

Over the course of the last 3 - 4 months my approach to iOS development (really all development) has changed significantly.  Managing state along with asynchronous operations is **difficult** and as apps grow more complex it becomes **even more difficult**.  Functional Reactive Programming makes these things simple, or rather *[simple made easy](https://www.infoq.com/presentations/Simple-Made-Easy)*.  I have started to use both RxSwift and ReactiveCocoa as much as possible.  While the learning curve can be a bit steep, the communities attached to both projects are extremely helpful and because I truly *love* Functional Reactive Programming I've stuck with it and learned quite a bit (but of course I still have a lot to learn :)).  As for which I prefer...I'm not quite sure.  ReactiveCocoa is obviously designed to make iOS developers feel more at home and it is a battle-tested framework that has a very solid user base.  RxSwift is (in my opinion) a bit more difficult to grasp primarily because of the naming of the different methods, units, etc. which can be a bit daunting at first.  One of the clear benefits of RxSwift is that ReactiveX is cross-platform, and the RxSwift community is growing at a rapid pace.  I would happily work with either.


I chose to use RxSwift and follow the principles of MVVM for this project.  One issue that I encountered is that I had never worked with [RxDataSources](https://github.com/RxSwiftCommunity/RxDataSources) before and I chose to use it for the search results view.  While I'm sure my implementation can be significantly refactored (and I plan on refactoring it) I learned a good deal about how to use RxDataSources and it is definitely a library that I plan on working with in the future.

When developing an iOS application I always strive to follow the principles of TDD however because I was a bit pressed for time when working on this application I was not able to write as many tests as I would have liked to.  While I have gained a solid grasp of RxSwift I don't have much experience in testing RxSwift code but I plan on learning quite literally starting today.  Following the red, green, refactor cycle is tremendously beneficial.

One more thing I would like to mention is that while I chose to use Storyboards for this project, I have more experience developing iOS applications with nibs/code.  Both have their benefits and drawbacks. 

Thank you for this opportunity.  If you have any questions please let me know.

