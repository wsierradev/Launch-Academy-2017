require_relative "user_account_validator"

users = [
  {
    email: "doc@d7miners.com",
    username: "doc",
    name: "Doc"
  },
  {
    email: "grumpy@d7miners.com",
    username: "",
    name: "Grumpy"
  },
  {
    email: "happy[at]d7miners.com",
    username: "happy",
    name: "Happy"
  },
  {
    email: "sleepy@d7miners.com",
    username: "",
    name: "Sleepy"
  },
  {
    email: "bashful@d7miners.com",
    name: "Bashful"
  },
  {
    email: "sneezy@d7miners.com",
    username: "sneezy",
    name: "sneezy"
  },
  {
    username: "dopey",
    name: "Dopey"
  }
]
require 'pry'
binding.pry
users.map { |user| UserAccountValidator.new(user) }
