# Coffee Shop

Make sure you read **all** of this document carefully, and follow the guidelines in it. Pay particular attention to the
"What We Care About" section.

## Background

We like coffee.

So we built an app to fetch coffee for people from our favourite barista.

The app keeps track of coffee ordered; what the balance is for each user; what users have paid for already; and what is
still owed.

## Data

We've got the following data

- `data/prices.json` - provided by our barista. Has details of what beverages are available, and what their prices are.
- `data/orders.json` - list of beverages ordered by users of the app.
- `data/payments.json` - list of payments made by users paying for items they have purchased.

## Requirements

- Load the list of prices
- Load the orders
  - Calculate the total cost of each user's orders
- Load the payments
  - Allocate the payments to each user by subtracting the payment from their owed total
  - Calculate what each user now owes after processing payments received from them
- Return a JSON string containing the results of this work.

(see `spec/coffee_app_integration_spec.rb` for specific examples)

## Getting Started

Extract all files from `coding-test.zip` into your project directory

Te application requires ruby and bundler to be installed. Before you begin; install the dependencies by running
`bundle`. Once the dependencies have been installed you'll have a few commands available:

- `bundle exec rake`  : Will attempt to run your application and print output to the terminal.
- `bundle exec rspec` : Runs the test suite, we've added a few integration tests to get you started, but you'll probably
  want to add more as you work.

## Submitting The Test

Zip the project directory as firstname_lastname.zip (where _firstname_ and _lastname_ are your names).

Then email the genereated zip file back to the person that sent you the test.

## What We Care About

First, you should write in Ruby.

We're interested in your method and how you approach the problem just as much as we're interested in the end
result. Might want go through your code with you afterwards, and you can talk to us about how you tackled it, why you
chose the approach you did, etc.

That said, here's what you should aim for with your code:

- Clean, readable, production quality code; would we want to work with your code as part of a bigger codebase?
- Good object modelling and design decisions
- Extensible code; adding features will be another exercise when you come back in person.
- Good use of Ruby idioms
- Solid testing approach _(hint - you should write more specs than what has been provided)_
- Use Git!
  - Commit small changes often so we can see your approach, and progress.
  - Include the `.git` directory in the packaged .zip file you send to us.

We haven't hidden any nasty tricks in the test. Don't overthink it. Just write nice, solid code.
