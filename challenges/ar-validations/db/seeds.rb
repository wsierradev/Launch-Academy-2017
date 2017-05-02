# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')
require 'faker'

5.times do
  new_recipe = Recipe.create(
    name: "#{Faker::Company.name}",
    ingredients: Faker::Hacker.noun,
    directions: Faker::Hacker.verb
  )

  random_amount = (rand(4) + 1)
  random_amount.times do
    Comment.create(
      body: Faker::Hacker.say_something_smart,
      recipe_id: new_recipe.id
    )
  end
end
