### Introduction

We have a data set of user accounts. However, some user data is missing or incomplete.

### Instructions

#### Part 1

Create a `UserAccountValidator` class, that takes in a hash to its constructor.
The hash should have the following keys.

* `:email`
* `:username`
* `:name`

Assign the values of theses keys to instance variables and create readers for them.

#### Part 2

The following conditions should `raise` an exception:

* email is missing.
* email does not contain an `@` symbol.
* username is missing.

Use the simple `raise 'message'` format for raising an exception.

#### Part 3

Create a custom error class, which inherits from `StandardError`, to handle
when emails are missing. Give the class a descriptive name.

#### Part 4

In the `runner.rb` file, use a `begin..rescue..end` code block to rescue all
`StandardError`s, and print out the details of what went wrong to the console.

#### Part 5

Write unit test for the `UserAccountValidator` class.

### Resources

* [StandardError - ruby-doc.org](https://ruby-doc.org/core/StandardError.html)
* [Exception - ruby-doc.org](https://ruby-doc.org/core/Exception.html)
* [Ruby Error Handling, Beyond the Basics](https://www.sitepoint.com/ruby-error-handling-beyond-basics/)
* [Exception Handling - Dan Nguyen](http://ruby.bastardsbook.com/chapters/exception-handling/)
* [Ruby Exceptions - RubyLearning.com](http://rubylearning.com/satishtalim/ruby_exceptions.html)
* [RSpec raise_error matcher](https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers/raise-error-matcher)
