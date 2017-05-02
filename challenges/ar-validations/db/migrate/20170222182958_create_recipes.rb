class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |table|
      table.string :name, null: false
      table.text :ingredients, null: false
      table.text :directions, null: false
    end
  end
end
