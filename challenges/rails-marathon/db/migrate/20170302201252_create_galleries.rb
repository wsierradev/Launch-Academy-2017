class CreateGalleries < ActiveRecord::Migration[5.0]
  def change
    create_table :galleries do |t|
      t.string :name, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.integer :zipcode, null: false
      t.text :description

      t.timestamps
    end
  end
end
