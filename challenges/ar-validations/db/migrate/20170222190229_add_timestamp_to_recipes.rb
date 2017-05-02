class AddTimestampToRecipes < ActiveRecord::Migration
  def change
    add_timestamps :recipes, null: false
  end
end
