# Brussels Sprouts Recipe Blog

```ruby
r = Recipe.last
```

1. Validate that the title of each recipe exists.

```ruby
r.name = ""
r.errors
=> @details={:name=>[{:error=>:blank}]},
@messages={:name=>["can't be blank"]}
```

2. Validate that the title of each recipe is unique.

```ruby
r2 = Recipe.create(name: "Morissette LLC", ingredients: "circuit", directions: "program")
r2.errors
=> {:name=>[{:error=>:taken, :value=>"Morissette LLC"}, {:error=>"only 'Brussels Sprouts' recipes allowed"}]},  @messages={:name=>["has already been taken", "only 'Brussels Sprouts' recipes allowed"]}
```

3. Validate that the title of each recipe contains "Brussels sprouts" in it.

See (2.)

4. Validate that the length of a comment be a maximum of 140 characters long.

```ruby
comment = ""
141.times { comment << "-" }
new_comment = Comment.create(recipe_id: r.id, body: comment)
new_comment.errors
=> @details={:body=>[{:error=>:too_long, :count=>140}]},
 @messages={:body=>["is too long (maximum is 140 characters)"]}
```

5. Validate that a comment has a recipe.

```ruby
new_comment2 = Comment.create(body: comment)
new_comment2.save
new_comment2.errors
=> @details={:body=>[{:error=>:too_long, :count=>140}], :recipe=>[{:error=>:blank}]},
 @messages={:body=>["is too long (maximum is 140 characters)"], :recipe=>["can't be blank"]}
```

6. Add a field servings to your Recipe table. This field is optional, but if supplied, it must be greater than or equal to 1.

```ruby
r.servings = 0
r.save
r.errors
=> @details=
  {:servings=>[{:error=>:greater_than_or_equal_to, :value=>0, :count=>1}],
   :name=>[{:error=>"only 'Brussels Sprouts' recipes allowed"}]},
 @messages=
  {:servings=>["must be greater than or equal to 1"], :name=>["only 'Brussels Sprouts' recipes allowed"]}
```
