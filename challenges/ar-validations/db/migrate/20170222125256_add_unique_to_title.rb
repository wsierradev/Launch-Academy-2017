class AddUniqueToTitle < ActiveRecord::Migration
  def change
    change_column :recipes, :name, :string, unique: true
  end
end
