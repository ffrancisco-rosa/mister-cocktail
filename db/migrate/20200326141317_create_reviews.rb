class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :content, null: false
      t.integer :rating, null: false
      t.references :cocktail

      t.timestamps
    end
  end
end
