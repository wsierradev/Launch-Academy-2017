class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :rating, null: false
      t.text :body, null: false
      t.belongs_to :restaurant, null: false

      t.timestamps
    end
  end
end
