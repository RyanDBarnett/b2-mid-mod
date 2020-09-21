# B2 Assessments

Base repository for B2 assessments and diagnostics.

This repository requires and has been tested on Ruby v2.5.3 and is based on Rails 5.2.4.3.

RSpec and Shoulda-Matchers have been installed and set up.

## Setup

1. fork this repo
2. clone your fork
3. `git clone <paste_repo>`
4. `cd b2-mid-mod`
5. `bundle install`

When you run `bundle exec rspec` you should have 0 tests.

## Instructions

* Work on this assessment independently. DO NOT discuss with anyone.
* Read each story carefully before you start working.
* Commit Frequently, about every 15 - 30 minutes
* Push your code to your fork once the time is up (not before!)

## Submission

Once the time for the assessment is up, push your code to your fork and create a pull request to the `turingschool-examples` repository. Include the following:

* Your Name
* A reflection on how you felt you did with this challenge and what story you got through

## Requirements

* TDD all new work
* model methods and relationships must be fully tested.

## Not Required

* No visual styling is required or expected
* You do not need to test for or create any model validations.

## User Stories

Field Trip is an app that allows a user to see airlines, flights, and passengers. Airlines have many flights, and flights belong to airlines. You will need to set up the table and relationship between airlines, passengers and flights. Flights have many passengers and passengers can have many flights. Make sure to read all instructions, tasks, and user stories before getting started. Also, take a look at your schema to see what you're working with to start.


## Tasks
1. Create a passengers table
  - Passengers will have a name and age

2. Set up a many to many relationship between flights and passengers

3. Complete the following user stories:

```
User Story 4, Passengers Index Page

As a visitor
When I visit a passengers index page ('/passengers')
I see names of all passengers
And next to the passengers name, I see the number of flights that the passenger has
